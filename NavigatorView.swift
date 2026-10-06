import SwiftUI
import UniformTypeIdentifiers
import PDFKit

struct NavigatorView: View {
    @State private var selectedSymptoms: Set<SymptomOption> = []
    @State private var preliminaryDiagnosis = ""
    @State private var selectedDiagnosisIDs: Set<String> = []
    @State private var diagnosisSearch = ""
    @State private var supportingDetails = ""
    @State private var careSetting: CareSetting = .symptomOnly
    @State private var matches: [RouteMatch] = []
    @State private var hasRun = false
    @State private var showSourceLibrary = false
    @State private var callSheet: [CallSheetEntry] = []
    @State private var callSheetStatus: String?
    @State private var showCallSheetImporter = false
    @State private var isCallSheetDropTarget = false

    private let engine = RoutingEngine(rules: ClinicalData.rules)

    var body: some View {
        NavigationSplitView {
            inputSidebar
                .navigationSplitViewColumnWidth(min: 310, ideal: 350, max: 410)
        } detail: {
            resultsPanel
        }
        .tint(.indigo)
        .sheet(isPresented: $showSourceLibrary) {
            SourceLibraryView()
                .frame(minWidth: 760, minHeight: 580)
        }
        .fileImporter(
            isPresented: $showCallSheetImporter,
            allowedContentTypes: [.commaSeparatedText, .plainText, .pdf],
            allowsMultipleSelection: false,
            onCompletion: importCallSheet
        )
    }

    private var inputSidebar: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Label("Clinical Specialty Navigator", systemImage: "point.3.connected.trianglepath.dotted")
                        .font(.title3.weight(.bold))
                    Text("An explainable, cited routing aid for discussing possible specialty involvement—not a diagnostic or triage tool.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                noticeCard

                VStack(alignment: .leading, spacing: 10) {
                    Text("1. Select signals")
                        .font(.headline)
                    ForEach(symptomCategories, id: \.self) { category in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(category.uppercased())
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(.secondary)
                            ForEach(SymptomOption.allCases.filter { $0.category == category }) { symptom in
                                Toggle(symptom.title, isOn: symptomBinding(for: symptom))
                                    .font(.subheadline)
                            }
                        }
                        .padding(.bottom, 7)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("2. Add context")
                        .font(.headline)
                    Text("Custom preliminary diagnosis or finding")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    TextField("Optional: add a clinician-entered term", text: $preliminaryDiagnosis)
                        .textFieldStyle(.roundedBorder)

                    diagnosisDatabasePicker

                    Text("Optional non-identifying notes")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    TextEditor(text: $supportingDetails)
                        .font(.subheadline)
                        .frame(minHeight: 70)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 7).stroke(.quaternary))

                    Picker("Entry point", selection: $careSetting) {
                        ForEach(CareSetting.allCases) { setting in
                            Text(setting.title).tag(setting)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Button(action: runRouting) {
                    Label("Find candidate services", systemImage: "arrow.right.circle.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

                HStack(spacing: 10) {
                    Button("Stroke example") { loadStrokeExample() }
                    Button("Clear") { clearInput() }
                }
                .buttonStyle(.borderless)
                .font(.footnote)

                callSheetSection

                Divider()

                Button {
                    showSourceLibrary = true
                } label: {
                    Label("Source library (\(ClinicalData.sources.count))", systemImage: "books.vertical")
                }
                .buttonStyle(.borderless)
                .font(.footnote.weight(.medium))

                Text("Inputs stay in this running app. This prototype has no networking, account, analytics, or record storage.")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            .padding(20)
        }
        .background(Color(nsColor: .windowBackgroundColor))
    }

    private var noticeCard: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.orange)
            Text("If there is severe chest pain, breathing difficulty, stroke signs, severe bleeding, a seizure, loss of consciousness, an immediate self-harm safety concern, or another immediate danger, call local emergency services now. Do not wait for an app result.")
                .font(.caption)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(12)
        .background(.orange.opacity(0.12), in: RoundedRectangle(cornerRadius: 10))
    }

    private var callSheetSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Optional hospital call sheet", systemImage: "person.3.sequence.fill")
                .font(.subheadline.weight(.medium))
            Text("Upload or drag in a CSV, text file, or searchable PDF to show the doctor on call beside each matching specialty. It stays only in memory for this app session; do not include patient information.")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text("Columns: specialty, subspecialty (optional), hospital, doctor name, contact (optional), notes (optional). PDF tables must retain selectable text with comma, tab, or | column separators; image-only/scanned PDFs need a CSV export.")
                .font(.caption2)
                .foregroundStyle(.secondary)

            HStack(spacing: 10) {
                Button(callSheet.isEmpty ? "Upload call sheet" : "Replace call sheet") {
                    showCallSheetImporter = true
                }
                .buttonStyle(.bordered)

                if !callSheet.isEmpty {
                    Text("\(callSheet.count) service row\(callSheet.count == 1 ? "" : "s") loaded")
                        .font(.caption.weight(.medium))
                        .foregroundStyle(.green)
                    Button("Remove") {
                        callSheet = []
                        callSheetStatus = "Call sheet removed from this app session."
                    }
                    .buttonStyle(.borderless)
                    .font(.caption)
                }
            }

            if let callSheetStatus {
                Text(callSheetStatus)
                    .font(.caption)
                    .foregroundStyle(callSheet.isEmpty ? Color.secondary : Color.green)
            }
        }
        .padding(12)
        .background(isCallSheetDropTarget ? .teal.opacity(0.16) : .teal.opacity(0.08), in: RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isCallSheetDropTarget ? Color.teal : Color.clear, style: StrokeStyle(lineWidth: 2, dash: [6]))
        )
        .onDrop(of: [UTType.fileURL], isTargeted: $isCallSheetDropTarget, perform: handleCallSheetDrop)
    }

    @ViewBuilder
    private var resultsPanel: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                if !hasRun {
                    welcomeState
                } else if matches.isEmpty {
                    noMatchState
                } else {
                    resultSummary
                    ForEach(matches) { match in
                        RouteCard(
                            match: match,
                            sources: sources(for: match),
                            callSheetEntries: callSheetEntries(for: match)
                        )
                    }
                    methodologyCard
                }
            }
            .padding(28)
            .frame(maxWidth: 960, alignment: .leading)
        }
        .background(Color(nsColor: .underPageBackgroundColor))
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Candidate specialty pathways")
                    .font(.largeTitle.weight(.bold))
                Text("Each card explains why it matched and names the sources behind the pathway.")
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Button {
                showSourceLibrary = true
            } label: {
                Label("Sources", systemImage: "link")
            }
            .buttonStyle(.bordered)
        }
    }

    private var welcomeState: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(systemName: "stethoscope.circle.fill")
                .font(.system(size: 52))
                .foregroundStyle(.indigo)
            Text("Start with signals, not a specialty guess.")
                .font(.title2.weight(.semibold))
            Text("Select symptoms and, if available, enter a preliminary diagnosis, imaging impression, or lab finding. The app will surface its limited set of transparent pathways and the specialists who may be involved. It does not estimate disease probability, make diagnoses, or decide eligibility for procedures.")
                .foregroundStyle(.secondary)
                .frame(maxWidth: 620, alignment: .leading)
            Divider()
            Text("Included examples distinguish areas such as endovascular/cerebrovascular neurosurgery versus spine neurosurgery, interventional cardiology versus electrophysiology, and retina versus general ophthalmology.")
                .font(.subheadline)
        }
        .padding(28)
        .background(.background, in: RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.04), radius: 7, y: 2)
    }

    private var noMatchState: some View {
        VStack(alignment: .leading, spacing: 14) {
            Label("No pathway in this small curated dataset matched.", systemImage: "magnifyingglass")
                .font(.title3.weight(.semibold))
            Text("That is not reassurance and does not mean no specialist is needed. This prototype only covers the scenarios in its source library. A primary-care clinician, an appropriate urgent service, or emergency services can assess the full situation and route care safely.")
                .foregroundStyle(.secondary)
        }
        .padding(24)
        .background(.background, in: RoundedRectangle(cornerRadius: 16))
    }

    private var resultSummary: some View {
        let emergency = matches.contains { $0.rule.urgency == .emergency }
        return VStack(alignment: .leading, spacing: 7) {
            Label(
                emergency ? "An emergency pathway matched" : "\(matches.count) cited pathway\(matches.count == 1 ? "" : "s") matched",
                systemImage: emergency ? "exclamationmark.octagon.fill" : "checkmark.circle.fill"
            )
            .font(.headline)
            .foregroundStyle(emergency ? .red : .green)
            Text(emergency ? "The selected signals overlap a time-sensitive pathway. If this describes a current situation, seek emergency help now; do not use the specialty list to select a clinic." : "Order reflects direct rule overlap and urgency, not disease likelihood, severity, or a referral recommendation.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background((emergency ? Color.red : Color.green).opacity(0.11), in: RoundedRectangle(cornerRadius: 12))
    }

    private var methodologyCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("How to interpret this")
                .font(.headline)
            Text("The app searches only the listed symptoms and text terms against a versioned, hand-authored rule set. “Strong signal match” means more rule terms overlapped; it is not a clinical probability. The clinical team determines diagnosis, triage setting, referral, and whether a subspecialty procedure is appropriate.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text("The treatment-direction label is a broad, hand-authored pathway description—not a prediction that an individual needs surgery, a procedure, or any specific treatment.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text("Content version 0.6 • Includes broad NHS Inform A–Z candidate-service mappings • Source links included with every pathway • Not clinically validated")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(18)
        .background(.background, in: RoundedRectangle(cornerRadius: 12))
    }

    private var symptomCategories: [String] {
        Array(Set(SymptomOption.allCases.map(\.category))).sorted()
    }

    private var diagnosisDatabasePicker: some View {
        DisclosureGroup {
            VStack(alignment: .leading, spacing: 8) {
            Text("Select clinician-entered preliminary diagnoses. Cited pathways may suggest candidate services. NHS Inform A–Z entries use a broad, condition-title-based service map; they do not determine urgency, diagnosis, or a referral order.")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                TextField("Search \(ClinicalData.preliminaryDiagnoses.count) diagnoses", text: $diagnosisSearch)
                    .textFieldStyle(.roundedBorder)

                if !selectedCatalogDiagnoses.isEmpty {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("SELECTED")
                            .font(.caption2.weight(.semibold))
                            .foregroundStyle(.secondary)
                        ForEach(selectedCatalogDiagnoses) { diagnosis in
                            Button {
                                selectedDiagnosisIDs.remove(diagnosis.id)
                            } label: {
                                Label(diagnosis.title, systemImage: "xmark.circle.fill")
                                    .font(.caption)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }

                ForEach(diagnosisGroups, id: \.self) { group in
                    VStack(alignment: .leading, spacing: 3) {
                        Text(group.uppercased())
                            .font(.caption2.weight(.semibold))
                            .foregroundStyle(.secondary)
                        ForEach(filteredDiagnoses.filter { $0.group == group }) { diagnosis in
                            Button {
                                toggleDiagnosis(diagnosis)
                            } label: {
                                HStack(alignment: .top, spacing: 7) {
                                    Image(systemName: selectedDiagnosisIDs.contains(diagnosis.id) ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(selectedDiagnosisIDs.contains(diagnosis.id) ? .indigo : .secondary)
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text(diagnosis.title)
                                            .font(.caption)
                                            .multilineTextAlignment(.leading)
                                        if diagnosis.isReferenceOnly {
                                            Text("NHS Inform index entry • no local specialty mapping")
                                                .font(.caption2)
                                                .foregroundStyle(.secondary)
                                        }
                                        if !diagnosis.aliases.isEmpty {
                                            Text(diagnosis.aliases.joined(separator: " • "))
                                                .font(.caption2)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                                    Spacer(minLength: 0)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.top, 3)
                }

                if filteredDiagnoses.isEmpty {
                    Text("No database entry matches this search. You can still enter custom text above.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.top, 6)
        } label: {
            Label("Preliminary-diagnosis database", systemImage: "cross.vial")
                .font(.subheadline.weight(.medium))
        }
        .padding(10)
        .background(.indigo.opacity(0.06), in: RoundedRectangle(cornerRadius: 8))
    }

    private var selectedCatalogDiagnoses: [PreliminaryDiagnosis] {
        ClinicalData.preliminaryDiagnoses.filter { selectedDiagnosisIDs.contains($0.id) }
    }

    private var filteredDiagnoses: [PreliminaryDiagnosis] {
        let query = diagnosisSearch.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return ClinicalData.preliminaryDiagnoses }
        return ClinicalData.preliminaryDiagnoses.filter { diagnosis in
            diagnosis.title.localizedCaseInsensitiveContains(query)
                || diagnosis.group.localizedCaseInsensitiveContains(query)
                || diagnosis.aliases.contains { $0.localizedCaseInsensitiveContains(query) }
        }
    }

    private var diagnosisGroups: [String] {
        Array(Set(filteredDiagnoses.map(\.group))).sorted()
    }

    private var routingDiagnosisText: String {
        ([preliminaryDiagnosis] + selectedCatalogDiagnoses.map(\.inputPhrase))
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: "; ")
    }

    private func symptomBinding(for symptom: SymptomOption) -> Binding<Bool> {
        Binding(
            get: { selectedSymptoms.contains(symptom) },
            set: { isSelected in
                if isSelected { selectedSymptoms.insert(symptom) }
                else { selectedSymptoms.remove(symptom) }
            }
        )
    }

    private func sources(for match: RouteMatch) -> [ClinicalSource] {
        match.rule.sourceIDs.compactMap { ClinicalData.sourceByID[$0] }
    }

    private func callSheetEntries(for match: RouteMatch) -> [CallSheetEntry] {
        callSheet.filter { entry in
            match.rule.recommendations.contains { entry.matches($0) }
        }
    }

    private func importCallSheet(_ result: Result<[URL], Error>) {
        do {
            let urls = try result.get()
            guard let url = urls.first else { return }
            loadCallSheet(from: url)
        } catch {
            callSheetStatus = "Could not load the call sheet: \(error.localizedDescription)"
        }
    }

    private func handleCallSheetDrop(providers: [NSItemProvider]) -> Bool {
        guard let provider = providers.first else { return false }
        _ = provider.loadObject(ofClass: URL.self) { url, error in
            DispatchQueue.main.async {
                guard let url, error == nil, url.isFileURL else {
                    callSheetStatus = "Could not read the dropped item. Drop one local CSV, text, or searchable PDF call sheet."
                    return
                }
                loadCallSheet(from: url)
            }
        }
        return true
    }

    private func loadCallSheet(from url: URL) {
        let fileExtension = url.pathExtension.lowercased()
        guard ["csv", "tsv", "txt", "pdf"].contains(fileExtension) else {
            callSheetStatus = "Unsupported call-sheet file. Use CSV, TSV, text, or a searchable PDF."
            return
        }

        let hasSecurityScopedAccess = url.startAccessingSecurityScopedResource()
        defer {
            if hasSecurityScopedAccess {
                url.stopAccessingSecurityScopedResource()
            }
        }

        do {
            let imported: CallSheetImport
            if fileExtension == "pdf" {
                guard let document = PDFDocument(url: url), let text = document.string,
                      !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                    callSheetStatus = "Could not extract searchable text from that PDF. Use a text-selectable PDF or export the call sheet as CSV."
                    return
                }
                imported = try CallSheetParser.parse(text, requiresHeader: true)
            } else {
                let data = try Data(contentsOf: url)
                guard let text = String(data: data, encoding: .utf8)
                    ?? String(data: data, encoding: .windowsCP1252) else {
                    callSheetStatus = "Could not read that file as text. Use CSV, TSV, or UTF-8 plain text."
                    return
                }
                imported = try CallSheetParser.parse(text)
            }

            callSheet = imported.entries
            let ignoredDetail = imported.ignoredRowCount == 0 ? "" : " \(imported.ignoredRowCount) row\(imported.ignoredRowCount == 1 ? " was" : "s were") ignored because specialty was blank."
            callSheetStatus = "Loaded \(imported.entries.count) call-sheet service row\(imported.entries.count == 1 ? "" : "s") from \(url.lastPathComponent).\(ignoredDetail)"
        } catch {
            callSheetStatus = "Could not load the call sheet: \(error.localizedDescription)"
        }
    }

    private func runRouting() {
        var evaluated = engine.evaluate(.init(
            symptoms: selectedSymptoms,
            preliminaryDiagnosis: routingDiagnosisText,
            supportingDetails: supportingDetails,
            setting: careSetting
        ))
        if evaluated.isEmpty, selectedCatalogDiagnoses.contains(where: { $0.isReferenceOnly }) {
            evaluated = [
                .init(
                    id: ClinicalData.nhsInformReferenceRule.id,
                    rule: ClinicalData.nhsInformReferenceRule,
                    score: 0,
                    matchedSymptoms: [],
                    matchedDiagnosisTerms: []
                )
            ]
        }
        matches = evaluated
        hasRun = true
    }

    private func loadStrokeExample() {
        selectedSymptoms = [.suddenOneSidedWeakness, .newSpeechDifficulty]
        preliminaryDiagnosis = ""
        selectedDiagnosisIDs = ["large-vessel-occlusion"]
        supportingDetails = "Example only. Do not enter identifying details."
        careSetting = .symptomOnly
        runRouting()
    }

    private func clearInput() {
        selectedSymptoms = []
        preliminaryDiagnosis = ""
        selectedDiagnosisIDs = []
        diagnosisSearch = ""
        supportingDetails = ""
        careSetting = .symptomOnly
        matches = []
        hasRun = false
    }

    private func toggleDiagnosis(_ diagnosis: PreliminaryDiagnosis) {
        if selectedDiagnosisIDs.contains(diagnosis.id) {
            selectedDiagnosisIDs.remove(diagnosis.id)
        } else {
            selectedDiagnosisIDs.insert(diagnosis.id)
        }
    }
}

private struct RouteCard: View {
    let match: RouteMatch
    let sources: [ClinicalSource]
    let callSheetEntries: [CallSheetEntry]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(match.rule.title)
                        .font(.title3.weight(.bold))
                    HStack(spacing: 8) {
                        UrgencyBadge(urgency: match.rule.urgency)
                        Text(match.fitDescription)
                            .font(.caption.weight(.medium))
                            .foregroundStyle(.secondary)
                    }
                }
                Spacer()
                Text("Rule overlap \(match.score)/100")
                    .font(.caption.monospacedDigit())
                    .foregroundStyle(.secondary)
            }

            Text(match.rule.rationale)
                .font(.subheadline)

            CareApproachCard(approach: match.rule.careApproach)

            if !match.matchedSymptoms.isEmpty || !match.matchedDiagnosisTerms.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Why this card appeared")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                    HStack(spacing: 6) {
                        ForEach(match.matchedSymptoms) { symptom in
                            MatchPill(text: symptom.title)
                        }
                        ForEach(match.matchedDiagnosisTerms, id: \.self) { term in
                            MatchPill(text: "Text: \(term)")
                        }
                    }
                }
            }

            Divider()

            VStack(alignment: .leading, spacing: 10) {
                Text("Possible services involved")
                    .font(.headline)
                ForEach(match.rule.recommendations) { recommendation in
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "cross.case.fill")
                                .foregroundStyle(.indigo)
                                .frame(width: 18)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(recommendation.specialty)
                                    .font(.subheadline.weight(.semibold))
                                Text(recommendation.subspecialty)
                                    .font(.subheadline)
                                Text(recommendation.role)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        CallSheetDoctorStatus(entries: callSheetEntries(for: recommendation))
                            .padding(.leading, 28)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Sources for this pathway")
                    .font(.headline)
                if match.rule.id.hasPrefix("nhs-") {
                    Text("For an imported NHS Inform label, these sources document the condition title and specialty terminology. The broad candidate-service map is not an NHS referral instruction and does not establish diagnosis or urgency.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                ForEach(sources) { source in
                    Link(destination: source.url) {
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "arrow.up.right.square")
                                .font(.caption)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(source.title)
                                    .font(.subheadline.weight(.medium))
                                Text("\(source.organization) • \(source.useInApp)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(20)
        .background(.background, in: RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(match.rule.urgency == .emergency ? Color.red.opacity(0.45) : Color.gray.opacity(0.15), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.035), radius: 6, y: 2)
    }

    private func callSheetEntries(for recommendation: SpecialtyRecommendation) -> [CallSheetEntry] {
        callSheetEntries.filter { $0.matches(recommendation) }
    }
}

private struct CallSheetDoctorStatus: View {
    let entries: [CallSheetEntry]

    private var doctorEntries: [CallSheetEntry] {
        entries.filter { !$0.doctorName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    }

    var body: some View {
        if doctorEntries.isEmpty {
            Text("Doctor for this specialty not uploaded")
                .font(.caption)
                .foregroundStyle(.secondary)
        } else {
            VStack(alignment: .leading, spacing: 3) {
                ForEach(doctorEntries) { entry in
                    Text("Doctor on call: \(entry.doctorName)")
                        .font(.caption.weight(.medium))
                        .foregroundStyle(.teal)
                    if !entry.hospital.isEmpty {
                        Text(entry.hospital)
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    if !entry.contact.isEmpty {
                        Text("Contact: \(entry.contact)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    if !entry.notes.isEmpty {
                        Text(entry.notes)
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                Text("Call-sheet information is local reference information only. Verify current coverage through the hospital before relying on it.")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct MatchPill: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .lineLimit(1)
            .padding(.horizontal, 9)
            .padding(.vertical, 5)
            .background(.indigo.opacity(0.1), in: Capsule())
    }
}

private struct CareApproachCard: View {
    let approach: CareApproach

    private var color: Color {
        switch approach {
        case .moreLikelyNonsurgical: .green
        case .procedureOrSurgeryMayBeNeeded: .orange
        case .surgicalEvaluationLikely: .red
        case .mixedCare: .purple
        case .notClassified: .secondary
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Likely treatment direction")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
            Label(approach.title, systemImage: approach.symbolName)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(color)
            Text(approach.explanation)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.10), in: RoundedRectangle(cornerRadius: 10))
    }
}

private struct UrgencyBadge: View {
    let urgency: Urgency

    private var color: Color {
        switch urgency {
        case .emergency: .red
        case .sameDay: .orange
        case .prompt: .blue
        case .routine: .green
        case .unspecified: .secondary
        case .reference: .secondary
        }
    }

    var body: some View {
        Text(urgency.title)
            .font(.caption.weight(.bold))
            .foregroundStyle(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.12), in: Capsule())
    }
}

private struct SourceLibraryView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List(ClinicalData.sources) { source in
                VStack(alignment: .leading, spacing: 5) {
                    Link(destination: source.url) {
                        Label(source.title, systemImage: "arrow.up.right.square")
                            .font(.headline)
                    }
                    Text(source.organization)
                        .font(.subheadline)
                    Text(source.useInApp)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Source library")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
