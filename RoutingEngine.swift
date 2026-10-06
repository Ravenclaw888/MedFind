import Foundation

struct RoutingEngine {
    let rules: [RoutingRule]

    func evaluate(_ input: RoutingInput) -> [RouteMatch] {
        let narrative = normalize("\(input.preliminaryDiagnosis) \(input.supportingDetails)")

        return rules.compactMap { rule in
            let symptomMatches = rule.requiredSymptoms.intersection(input.symptoms).sorted { $0.title < $1.title }
            let diagnosisMatches = rule.diagnosisTerms.filter { narrativeContains($0, in: narrative) }
            guard !symptomMatches.isEmpty || !diagnosisMatches.isEmpty else { return nil }

            // This score expresses explicit rule overlap only. It is intentionally not a probability,
            // severity measure, or diagnosis confidence.
            let score = min(100, symptomMatches.count * 24 + diagnosisMatches.count * 28 + rule.urgency.rawValue * 5)
            return RouteMatch(
                id: rule.id,
                rule: rule,
                score: score,
                matchedSymptoms: symptomMatches,
                matchedDiagnosisTerms: diagnosisMatches
            )
        }
        .sorted {
            if $0.rule.urgency != $1.rule.urgency { return $0.rule.urgency > $1.rule.urgency }
            if $0.score != $1.score { return $0.score > $1.score }
            return $0.rule.title < $1.rule.title
        }
    }

    private func narrativeContains(_ term: String, in narrative: String) -> Bool {
        let normalizedTerm = normalize(term)
        guard !normalizedTerm.isEmpty else { return false }
        return " \(narrative) ".contains(" \(normalizedTerm) ")
    }

    private func normalize(_ text: String) -> String {
        text
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}
