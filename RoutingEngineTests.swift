import XCTest
@testable import ClinicalSpecialtyNavigator

final class RoutingEngineTests: XCTestCase {
    private let engine = RoutingEngine(rules: ClinicalData.rules)

    func testStrokeSignalsSurfaceEmergencyStrokeAndEndovascularPathway() {
        let matches = engine.evaluate(.init(
            symptoms: [.suddenOneSidedWeakness, .newSpeechDifficulty],
            preliminaryDiagnosis: "possible large vessel occlusion",
            supportingDetails: "",
            setting: .symptomOnly
        ))

        let stroke = try! XCTUnwrap(matches.first { $0.id == "acute-stroke" })
        XCTAssertEqual(stroke.rule.urgency, .emergency)
        XCTAssertTrue(stroke.rule.recommendations.contains { $0.subspecialty.contains("Endovascular") })
        XCTAssertEqual(stroke.matchedSymptoms.count, 2)
        XCTAssertTrue(stroke.matchedDiagnosisTerms.contains("large vessel occlusion"))
    }

    func testSpineSignalsSurfaceSpineRatherThanEndovascularNeurosurgery() {
        let matches = engine.evaluate(.init(
            symptoms: [.newBowelBladderChange, .severeBackPainWithWeakness],
            preliminaryDiagnosis: "possible cauda equina",
            supportingDetails: "",
            setting: .imagingOrLabResult
        ))

        let spine = try! XCTUnwrap(matches.first { $0.id == "spine-compression" })
        XCTAssertEqual(spine.rule.urgency, .emergency)
        XCTAssertEqual(spine.rule.careApproach, .surgicalEvaluationLikely)
        XCTAssertTrue(spine.rule.recommendations.contains { $0.subspecialty == "Spine Neurosurgery" })
        XCTAssertFalse(spine.rule.recommendations.contains { $0.subspecialty.contains("Endovascular") })
    }

    func testKnownCancerTextRoutesToMultiDisciplinaryCancerServices() {
        let matches = engine.evaluate(.init(
            symptoms: [],
            preliminaryDiagnosis: "new lymphoma diagnosis",
            supportingDetails: "",
            setting: .alreadyDiagnosed
        ))

        let cancer = try! XCTUnwrap(matches.first { $0.id == "known-cancer" })
        XCTAssertTrue(cancer.rule.recommendations.contains { $0.subspecialty == "Hematology" })
        XCTAssertTrue(cancer.rule.recommendations.contains { $0.subspecialty == "Medical Oncology" })
    }

    func testUnrelatedInputDoesNotProduceAFalsePositive() {
        let matches = engine.evaluate(.init(
            symptoms: [],
            preliminaryDiagnosis: "sprain",
            supportingDetails: "",
            setting: .symptomOnly
        ))

        XCTAssertTrue(matches.isEmpty)
    }

    func testCallSheetImportIncludesDoctorNamesAndSpecialtyMatching() throws {
        let callSheet = try CallSheetParser.parse(
            """
            specialty,subspecialty,hospital,doctor name,contact,notes
            Neurosurgery,Spine Neurosurgery,North Hospital,Dr. Patel,555-0100,Ask for spine call
            Cardiology,,North Hospital,Dr. Rivera,555-0110,General cardiology coverage
            """
        )

        XCTAssertEqual(callSheet.entries.count, 2)
        XCTAssertEqual(callSheet.entries[0].doctorName, "Dr. Patel")
        let spineService = SpecialtyRecommendation(
            id: "spine",
            specialty: "Neurological Surgery",
            subspecialty: "Spine Neurosurgery",
            role: ""
        )
        let strokeService = SpecialtyRecommendation(
            id: "stroke",
            specialty: "Neurology",
            subspecialty: "Vascular Neurology / Stroke",
            role: ""
        )
        XCTAssertTrue(callSheet.entries[0].matches(spineService))
        XCTAssertFalse(callSheet.entries[0].matches(strokeService))
        XCTAssertTrue(callSheet.entries[1].matches(.init(id: "cardiology", specialty: "Cardiology", subspecialty: "General Cardiology", role: "")))
    }

    func testSearchablePDFStyleCallSheetFindsDelimitedHeaderAfterTitleLines() throws {
        let callSheet = try CallSheetParser.parse(
            """
            Example Hospital call sheet
            Updated today
            Specialty | Subspecialty | Hospital | Doctor on call | Contact | Notes
            Cardiology | Clinical Cardiac Electrophysiology | Example Hospital | Dr. Chen | 555-0110 | Page EP fellow
            """,
            requiresHeader: true
        )

        XCTAssertEqual(callSheet.entries.count, 1)
        XCTAssertEqual(callSheet.entries[0].doctorName, "Dr. Chen")
        XCTAssertEqual(callSheet.entries[0].hospital, "Example Hospital")
        XCTAssertTrue(callSheet.entries[0].matches(.init(id: "ep", specialty: "Cardiology", subspecialty: "Clinical Cardiac Electrophysiology", role: "")))
    }

    func testNHSInformIndexMapsEveryLabelWithoutSubstringFalsePositives() {
        XCTAssertEqual(NHSInformCatalog.diagnoses.count, 479)
        XCTAssertEqual(NHSInformCatalog.diagnoses.first?.title, "Abdominal aortic aneurysm")
        XCTAssertEqual(NHSInformCatalog.diagnoses.last?.title, "Zika virus")
        XCTAssertTrue(NHSInformCatalog.diagnoses.allSatisfy {
            !$0.isReferenceOnly
                && $0.routeIDs.count == 1
                && $0.sourceIDs == ["nhs-inform-az", "abms-taxonomy"]
        })
        XCTAssertTrue(NHSInformSpecialtyMappings.rules.allSatisfy { !$0.diagnosisTerms.isEmpty })

        let heatstroke = engine.evaluate(.init(
            symptoms: [],
            preliminaryDiagnosis: "heatstroke",
            supportingDetails: "",
            setting: .alreadyDiagnosed
        ))
        XCTAssertFalse(heatstroke.contains { $0.id == "acute-stroke" })

        let aorticAneurysm = engine.evaluate(.init(
            symptoms: [],
            preliminaryDiagnosis: "abdominal aortic aneurysm",
            supportingDetails: "",
            setting: .alreadyDiagnosed
        ))
        XCTAssertFalse(aorticAneurysm.contains { $0.id == "cerebrovascular-aneurysm" })
    }

    func testEveryRuleHasResolvableSourcesAndRecommendations() {
        for rule in ClinicalData.rules {
            XCTAssertFalse(rule.careApproach.title.isEmpty, "\(rule.id) needs a treatment-direction label")
            XCTAssertFalse(rule.careApproach.explanation.isEmpty, "\(rule.id) needs a treatment-direction explanation")
            XCTAssertFalse(rule.recommendations.isEmpty, "\(rule.id) should name a service")
            XCTAssertFalse(rule.sourceIDs.isEmpty, "\(rule.id) should cite a source")
            for sourceID in rule.sourceIDs {
                let source = ClinicalData.sourceByID[sourceID]
                XCTAssertNotNil(source, "\(rule.id) references missing source \(sourceID)")
                XCTAssertNotNil(source?.url.scheme)
            }
        }
    }

    func testEveryDatabaseDiagnosisIsCitedAndRoutesToItsDeclaredPathway() {
        let ruleIDs = Set(ClinicalData.rules.map(\.id))

        for diagnosis in ClinicalData.preliminaryDiagnoses {
            XCTAssertFalse(diagnosis.sourceIDs.isEmpty, "\(diagnosis.title) needs a source")
            XCTAssertTrue(diagnosis.sourceIDs.allSatisfy { ClinicalData.sourceByID[$0] != nil }, "\(diagnosis.title) references an unknown source")
            if diagnosis.isReferenceOnly {
                XCTFail("Unexpected reference-only entry: \(diagnosis.title)")
                continue
            }
            XCTAssertFalse(diagnosis.routeIDs.isEmpty, "\(diagnosis.title) needs a pathway")
            XCTAssertTrue(diagnosis.routeIDs.allSatisfy(ruleIDs.contains), "\(diagnosis.title) references an unknown pathway")

            let matches = engine.evaluate(.init(
                symptoms: [],
                preliminaryDiagnosis: diagnosis.inputPhrase,
                supportingDetails: "",
                setting: .alreadyDiagnosed
            ))
            XCTAssertTrue(
                matches.contains { diagnosis.routeIDs.contains($0.id) },
                "\(diagnosis.title) should activate one of its declared pathways"
            )
        }
    }
}
