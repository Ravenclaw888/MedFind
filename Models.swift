import Foundation

enum SymptomOption: String, CaseIterable, Identifiable, Hashable {
    case suddenOneSidedWeakness
    case newSpeechDifficulty
    case facialDroop
    case suddenVisionLoss
    case thunderclapHeadache
    case persistentChestPressure
    case shortnessOfBreath
    case palpitations
    case fainting
    case severeBackPainWithWeakness
    case newBowelBladderChange
    case foodSticking
    case blackOrBloodyStool
    case jaundice
    case unintentionalWeightLoss
    case abnormalUterineBleeding
    case difficultyConceiving
    case flashesFloatersCurtain
    case changingBleedingMole
    case bloodInUrine
    case swollenPainfulJoint
    case seizureOrConvulsion
    case thoughtsOfSelfHarm
    case suddenHearingLoss
    case recurrentWheeze
    case flankPainWithUrinarySymptoms
    case breastLumpOrNippleChange
    case pregnancyWarningSymptoms
    case recurrentMigraineLikeHeadache
    case acuteKneeInstability
    case loudSnoringWithSleepiness
    case oneSidedLegSwellingPain

    var id: String { rawValue }

    var title: String {
        switch self {
        case .suddenOneSidedWeakness: "Sudden one-sided weakness or numbness"
        case .newSpeechDifficulty: "New speech or understanding difficulty"
        case .facialDroop: "New facial droop"
        case .suddenVisionLoss: "Sudden vision loss or double vision"
        case .thunderclapHeadache: "Sudden, severe ‘worst’ headache"
        case .persistentChestPressure: "Chest pressure, squeezing, or pain"
        case .shortnessOfBreath: "Shortness of breath"
        case .palpitations: "Fast, irregular, or pounding heartbeat"
        case .fainting: "Fainting or near-fainting"
        case .severeBackPainWithWeakness: "Back/neck pain with new weakness"
        case .newBowelBladderChange: "New bowel or bladder change with back pain"
        case .foodSticking: "Food sticking or trouble swallowing"
        case .blackOrBloodyStool: "Black, tarry, or bloody stool"
        case .jaundice: "Yellow skin or eyes (jaundice)"
        case .unintentionalWeightLoss: "Unintentional weight loss"
        case .abnormalUterineBleeding: "Abnormal uterine/vaginal bleeding"
        case .difficultyConceiving: "Difficulty conceiving"
        case .flashesFloatersCurtain: "New flashes, floaters, or a vision curtain"
        case .changingBleedingMole: "Changing, bleeding, or unusual mole/spot"
        case .bloodInUrine: "Blood in urine"
        case .swollenPainfulJoint: "Persistently swollen, painful joint"
        case .seizureOrConvulsion: "Seizure, convulsion, or unexplained loss of awareness"
        case .thoughtsOfSelfHarm: "Thoughts of self-harm or suicide"
        case .suddenHearingLoss: "Sudden hearing loss in one or both ears"
        case .recurrentWheeze: "Recurring wheeze, cough, or chest tightness"
        case .flankPainWithUrinarySymptoms: "Severe side/back pain with urinary symptoms"
        case .breastLumpOrNippleChange: "Breast lump, skin change, or nipple discharge"
        case .pregnancyWarningSymptoms: "Pregnancy/recent-postpartum warning symptoms"
        case .recurrentMigraineLikeHeadache: "Recurrent migraine-like headaches"
        case .acuteKneeInstability: "Knee twist/injury with swelling or instability"
        case .loudSnoringWithSleepiness: "Loud snoring/gasping with daytime sleepiness"
        case .oneSidedLegSwellingPain: "One-sided leg swelling, warmth, or pain"
        }
    }

    var category: String {
        switch self {
        case .suddenOneSidedWeakness, .newSpeechDifficulty, .facialDroop, .suddenVisionLoss, .thunderclapHeadache, .seizureOrConvulsion, .recurrentMigraineLikeHeadache:
            "Brain & nerves"
        case .persistentChestPressure, .shortnessOfBreath, .palpitations, .fainting, .oneSidedLegSwellingPain:
            "Heart & circulation"
        case .severeBackPainWithWeakness, .newBowelBladderChange, .swollenPainfulJoint, .acuteKneeInstability:
            "Spine, joints & nerves"
        case .foodSticking, .blackOrBloodyStool, .jaundice, .unintentionalWeightLoss:
            "Digestive & cancer signals"
        case .recurrentWheeze, .loudSnoringWithSleepiness:
            "Breathing & sleep"
        case .abnormalUterineBleeding, .difficultyConceiving, .bloodInUrine, .flankPainWithUrinarySymptoms, .breastLumpOrNippleChange, .pregnancyWarningSymptoms:
            "Reproductive & urinary"
        case .flashesFloatersCurtain, .changingBleedingMole:
            "Eye & skin"
        case .suddenHearingLoss:
            "Ear, nose & throat"
        case .thoughtsOfSelfHarm:
            "Mental health & safety"
        }
    }
}

enum CareSetting: String, CaseIterable, Identifiable {
    case unknown
    case symptomOnly
    case primaryCareReferral
    case imagingOrLabResult
    case alreadyDiagnosed

    var id: String { rawValue }
    var title: String {
        switch self {
        case .unknown: "Not specified"
        case .symptomOnly: "Symptoms only"
        case .primaryCareReferral: "Primary-care referral"
        case .imagingOrLabResult: "Imaging or lab result"
        case .alreadyDiagnosed: "Known preliminary diagnosis"
        }
    }
}

enum Urgency: Int, Comparable {
    case emergency = 5
    case sameDay = 4
    case prompt = 3
    case routine = 2
    case unspecified = 1
    case reference = 0

    static func < (lhs: Urgency, rhs: Urgency) -> Bool { lhs.rawValue < rhs.rawValue }

    var title: String {
        switch self {
        case .emergency: "Emergency evaluation now"
        case .sameDay: "Same-day clinical evaluation"
        case .prompt: "Prompt clinician review"
        case .routine: "Routine clinician review"
        case .unspecified: "Urgency needs clinical assessment"
        case .reference: "Reference-only entry"
        }
    }

    var explanation: String {
        switch self {
        case .emergency: "Do not use this app to choose a clinic or delay emergency care. Call local emergency services if this is happening now."
        case .sameDay: "Contact an appropriate clinician or urgent service today; the correct setting depends on severity and local access."
        case .prompt: "Bring this to a clinician soon. The output is a discussion aid, not a diagnosis or referral order."
        case .routine: "Discuss this with a clinician. They will decide whether a specialist referral is appropriate."
        case .unspecified: "A condition title alone cannot determine urgency. A clinician must assess current symptoms, severity, history, and test results. Use emergency services for an immediate danger."
        case .reference: "This indexed condition name is not an urgency classification or a specialty referral. A clinician must assess the actual situation."
        }
    }
}

/// A broad, pathway-level description of the type of treatment that is commonly
/// considered. It is deliberately not a prediction that an individual needs an
/// operation or procedure.
enum CareApproach: String {
    case moreLikelyNonsurgical
    case procedureOrSurgeryMayBeNeeded
    case surgicalEvaluationLikely
    case mixedCare
    case notClassified

    var title: String {
        switch self {
        case .moreLikelyNonsurgical: "More likely nonsurgical care"
        case .procedureOrSurgeryMayBeNeeded: "A procedure or surgery may be involved"
        case .surgicalEvaluationLikely: "Surgical evaluation is likely"
        case .mixedCare: "Treatment direction depends on findings"
        case .notClassified: "Treatment direction not classified"
        }
    }

    var explanation: String {
        switch self {
        case .moreLikelyNonsurgical:
            "This pathway usually begins with diagnostic, medical, behavioral, or rehabilitative care. A procedure can still become appropriate after assessment."
        case .procedureOrSurgeryMayBeNeeded:
            "A procedure-capable or surgical service may be involved, but the need for one depends on examination, testing, severity, and the treating team."
        case .surgicalEvaluationLikely:
            "The matched situation warrants surgical-team assessment. That does not mean an operation is certain; the treating team decides after urgent evaluation."
        case .mixedCare:
            "Both nonsurgical and surgical or procedural options can be relevant. The diagnosis, severity, and test results determine the direction."
        case .notClassified:
            "An index label alone is not enough to classify treatment direction. A clinician must assess the actual situation."
        }
    }

    var symbolName: String {
        switch self {
        case .moreLikelyNonsurgical: "stethoscope"
        case .procedureOrSurgeryMayBeNeeded: "cross.case.fill"
        case .surgicalEvaluationLikely: "cross.case.fill"
        case .mixedCare: "arrow.triangle.branch"
        case .notClassified: "questionmark.circle"
        }
    }
}

struct ClinicalSource: Identifiable, Hashable {
    let id: String
    let title: String
    let organization: String
    let url: URL
    let useInApp: String
}

/// A selectable, clinician-facing phrase that can be added to the routing input.
/// It is not a diagnosis made by this app.
struct PreliminaryDiagnosis: Identifiable, Hashable {
    let id: String
    let title: String
    let group: String
    let aliases: [String]
    let routeIDs: [String]
    let sourceIDs: [String]

    var inputPhrase: String { title }
    var isReferenceOnly: Bool { routeIDs.isEmpty }
}

struct SpecialtyRecommendation: Identifiable, Hashable {
    let id: String
    let specialty: String
    let subspecialty: String
    let role: String
}

/// A locally imported hospital/service call-sheet row. The call sheet stays in memory
/// for the current app session and is never used to make a clinical decision.
struct CallSheetEntry: Identifiable, Hashable {
    let id = UUID()
    let specialty: String
    let subspecialty: String
    let hospital: String
    let doctorName: String
    let contact: String
    let notes: String

    var serviceTitle: String {
        subspecialty.isEmpty ? specialty : "\(specialty) — \(subspecialty)"
    }

    func matches(_ recommendation: SpecialtyRecommendation) -> Bool {
        guard Self.servicesMatch(specialty, recommendation.specialty) else { return false }
        return subspecialty.isEmpty || Self.servicesMatch(subspecialty, recommendation.subspecialty)
    }

    private static func servicesMatch(_ callSheetService: String, _ candidateService: String) -> Bool {
        let callSheet = canonicalServiceName(callSheetService)
        let candidate = canonicalServiceName(candidateService)
        guard !callSheet.isEmpty, !candidate.isEmpty else { return false }
        if callSheet == candidate { return true }

        // A call-sheet entry may be broad (for example, "Cardiology") while the app
        // names a more focused service (for example, "General Cardiology").
        // Do not use short, broad names such as "Surgery" for partial matches.
        return callSheet.count >= 9 && (candidate.contains(callSheet) || callSheet.contains(candidate))
    }

    private static func canonicalServiceName(_ text: String) -> String {
        let normalized = normalize(text)
        return switch normalized {
        case "neurosurgery": "neurological surgery"
        case "ob gyn", "obgyn": "obstetrics and gynecology"
        case "ent": "otolaryngology head and neck surgery"
        case "ed", "er": "emergency medicine"
        default: normalized
        }
    }

    private static func normalize(_ text: String) -> String {
        text
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}

struct CallSheetImport {
    let entries: [CallSheetEntry]
    let ignoredRowCount: Int
}

enum CallSheetImportError: LocalizedError {
    case noUsableRows
    case noRecognizedHeader

    var errorDescription: String? {
        switch self {
        case .noUsableRows:
            "No usable call-sheet rows were found. Include a specialty in each row."
        case .noRecognizedHeader:
            "No call-sheet header was found. Use specialty, subspecialty, hospital, doctor name, contact, and notes columns."
        }
    }
}

/// Imports a deliberately small, transparent CSV/TSV/plain-text format.
/// Header names are flexible; without a header, columns are interpreted as:
/// specialty, subspecialty, hospital, doctor name, contact, notes.
enum CallSheetParser {
    static func parse(_ text: String, requiresHeader: Bool = false) throws -> CallSheetImport {
        let inputLines: [String] = text
            .split(whereSeparator: \.isNewline)
            .map(String.init)
            .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
        guard !inputLines.isEmpty else { throw CallSheetImportError.noUsableRows }

        let workingLines: [String]
        if requiresHeader {
            var headerIndex: Int?
            for (index, line) in inputLines.enumerated() {
                let candidateDelimiter: Character = delimiter(for: line)
                let candidateFields: [String] = fields(in: line, delimiter: candidateDelimiter)
                let candidateHeaders: [String: Int] = makeHeaderMap(candidateFields)
                if candidateHeaders["specialty"] != nil {
                    headerIndex = index
                    break
                }
            }
            guard let headerIndex else {
                throw CallSheetImportError.noRecognizedHeader
            }
            workingLines = Array(inputLines.dropFirst(headerIndex))
        } else {
            workingLines = inputLines
        }

        let firstLine: String = workingLines[0]
        let rowDelimiter: Character = delimiter(for: firstLine)
        let firstRow: [String] = fields(in: firstLine, delimiter: rowDelimiter)
        let headerMap: [String: Int] = makeHeaderMap(firstRow)
        let hasHeader: Bool = headerMap["specialty"] != nil
        let rows: [String] = hasHeader ? Array(workingLines.dropFirst()) : workingLines

        var entries: [CallSheetEntry] = []
        var ignoredRows = 0
        for line in rows {
            let values = fields(in: line, delimiter: rowDelimiter)
            let specialty = value(named: "specialty", from: values, headerMap: headerMap, fallbackIndex: 0)
            guard !specialty.isEmpty else {
                ignoredRows += 1
                continue
            }
            entries.append(
                CallSheetEntry(
                    specialty: specialty,
                    subspecialty: value(named: "subspecialty", from: values, headerMap: headerMap, fallbackIndex: hasHeader ? nil : 1),
                    hospital: value(named: "hospital", from: values, headerMap: headerMap, fallbackIndex: hasHeader ? nil : 2),
                    doctorName: value(named: "doctorName", from: values, headerMap: headerMap, fallbackIndex: hasHeader ? nil : 3),
                    contact: value(named: "contact", from: values, headerMap: headerMap, fallbackIndex: hasHeader ? nil : 4),
                    notes: value(named: "notes", from: values, headerMap: headerMap, fallbackIndex: hasHeader ? nil : 5)
                )
            )
        }

        guard !entries.isEmpty else { throw CallSheetImportError.noUsableRows }
        return CallSheetImport(entries: entries, ignoredRowCount: ignoredRows)
    }

    private static func delimiter(for line: String) -> Character {
        if line.contains("\t") { return "\t" }
        if line.contains("|") { return "|" }
        return ","
    }

    private static func makeHeaderMap(_ row: [String]) -> [String: Int] {
        var map: [String: Int] = [:]
        for (index, value) in row.enumerated() {
            switch normalized(value) {
            case "specialty", "speciality", "service", "department": map["specialty"] = index
            case "subspecialty", "sub speciality", "focus": map["subspecialty"] = index
            case "hospital", "facility", "location": map["hospital"] = index
            case "doctor", "doctor name", "doctor on call", "on call doctor", "on call physician", "physician", "clinician": map["doctorName"] = index
            case "contact", "phone", "pager", "extension", "on call contact": map["contact"] = index
            case "notes", "coverage", "instructions": map["notes"] = index
            default: break
            }
        }
        return map
    }

    private static func value(named name: String, from values: [String], headerMap: [String: Int], fallbackIndex: Int?) -> String {
        guard let index = headerMap[name] ?? fallbackIndex else { return "" }
        guard values.indices.contains(index) else { return "" }
        return values[index].trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private static func normalized(_ text: String) -> String {
        text
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }

    private static func fields(in line: String, delimiter: Character) -> [String] {
        var values: [String] = []
        var current = ""
        var isQuoted = false
        var index = line.startIndex

        while index < line.endIndex {
            let character = line[index]
            if character == "\"" {
                let next = line.index(after: index)
                if isQuoted, next < line.endIndex, line[next] == "\"" {
                    current.append("\"")
                    index = line.index(after: next)
                    continue
                }
                isQuoted.toggle()
            } else if character == delimiter, !isQuoted {
                values.append(current)
                current = ""
            } else {
                current.append(character)
            }
            index = line.index(after: index)
        }
        values.append(current)
        return values
    }
}

struct RoutingRule: Identifiable {
    let id: String
    let title: String
    let requiredSymptoms: Set<SymptomOption>
    let diagnosisTerms: [String]
    let urgency: Urgency
    let rationale: String
    let careApproach: CareApproach
    let recommendations: [SpecialtyRecommendation]
    let sourceIDs: [String]
}

struct RoutingInput {
    let symptoms: Set<SymptomOption>
    let preliminaryDiagnosis: String
    let supportingDetails: String
    let setting: CareSetting
}

struct RouteMatch: Identifiable {
    let id: String
    let rule: RoutingRule
    let score: Int
    let matchedSymptoms: [SymptomOption]
    let matchedDiagnosisTerms: [String]

    var fitDescription: String {
        if matchedSymptoms.isEmpty && matchedDiagnosisTerms.isEmpty { return "Reference-only entry" }
        if matchedSymptoms.count >= 2 || matchedDiagnosisTerms.count >= 2 { return "Strong signal match" }
        if !matchedSymptoms.isEmpty && !matchedDiagnosisTerms.isEmpty { return "Cross-checked signal match" }
        return "Single-signal match"
    }
}
