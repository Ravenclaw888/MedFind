# MedFinder

A native macOS SwiftUI prototype that converts selected symptoms and preliminary diagnostic text into transparent, cited **candidate specialty pathways**. It is intentionally a clinical-navigation discussion aid—not a diagnostic tool, an emergency triage product, or an automated referral system. Its built application file is `MedFinder.app`.

## Run it

Open [`ClinicalSpecialtyNavigator.xcodeproj`](ClinicalSpecialtyNavigator.xcodeproj) in Xcode, select the **ClinicalSpecialtyNavigator** scheme and **My Mac**, then press **Run** (⌘R).

This is important: run the Xcode **app target**, not `swift run`. Swift Package Manager launches a raw executable without a macOS app bundle identifier, which can emit `linkd.autoShortcut` / window-tab indexing messages. The Xcode target supplies the `com.codex.clinicalspecialtynavigator` bundle identifier and a standard macOS app bundle.

The Swift Package command remains useful for the deterministic routing-engine tests:

```bash
swift test
```

## What is included

- A polished macOS SwiftUI interface with symptom selection, optional preliminary-diagnosis text, clear safety messaging, no networking, and no persistent storage. It can also upload or accept drag-and-drop for a local CSV, text, or searchable-PDF hospital call sheet for the current app session, showing an uploaded doctor-on-call name beside each matching specialty.
- 52 auditable routing pathways and a selectable preliminary-diagnosis database with 582 entries: 103 curated, source-backed terms plus 479 NHS Inform A–Z titles. Every NHS Inform title has a broad candidate-service mapping; it does not establish a diagnosis, urgency, or referral order.
- A per-result explanation, matched input signals, possible specialty/subspecialty list, urgency label, and the exact source links used for that pathway.
- A source library covering all entries in the rules dataset and tests that fail if a rule lacks a source or specialty recommendation.

## Content boundaries

The data is a small, hand-authored starter dataset. A symptom alone cannot establish a diagnosis, a referral, urgency, or a procedure choice. The rule-overlap score is deliberately **not** a probability, clinical severity score, or referral recommendation. Emergency symptoms should be handled through local emergency services, not with the app.

Before real clinical use, have the pathways independently reviewed by clinicians and compliance/privacy teams, define the intended geography and care setting, add a maintained guideline-review process, and conduct usability and safety validation.

## Extending the app safely

Core pathways and sources are in [`ClinicalData.swift`](Sources/ClinicalSpecialtyNavigator/ClinicalData.swift); NHS Inform A–Z mappings are in [`NHSInformCatalog.swift`](Sources/ClinicalSpecialtyNavigator/NHSInformCatalog.swift). Each new `RoutingRule` or `PreliminaryDiagnosis` should:

1. use conservative language and specify a non-diagnostic rationale;
2. name the specialty plus the focused service area where applicable;
3. cite one or more stable, authoritative sources in `sources`;
4. state the urgency carefully; and
5. add a test in `RoutingEngineTests.swift`.

`RoutingEngine.swift` is deterministic and inspectable by design. It only searches the selected symptom values and supplied text terms; it does not call a model or a remote service.
