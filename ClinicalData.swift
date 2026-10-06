import Foundation

enum ClinicalData {
    static let sources: [ClinicalSource] = [
        .init(
            id: "abms-taxonomy",
            title: "Specialty & Subspecialty Certificates",
            organization: "American Board of Medical Specialties",
            url: URL(string: "https://www.abms.org/member-boards/specialty-subspecialty-certificates/")!,
            useInApp: "Names and framing of board-recognized specialties and subspecialties. Some clinical focus labels in this app are not ABMS certificate names."
        ),
        .init(
            id: "cdc-stroke",
            title: "Signs and Symptoms of Stroke",
            organization: "Centers for Disease Control and Prevention",
            url: URL(string: "https://www.cdc.gov/stroke/signs-symptoms/index.html")!,
            useInApp: "Emergency stroke-warning symptom pathway."
        ),
        .init(
            id: "aha-acute-stroke",
            title: "2019 Update: Early Management of Acute Ischemic Stroke",
            organization: "American Heart Association / American Stroke Association",
            url: URL(string: "https://professional.heart.org/en/science-news/2019-update-to-the-2018-acute-ischemic-stroke-guidelines/top-things-to-know")!,
            useInApp: "Stroke-system and thrombectomy-capable-center context; not an individual eligibility rule."
        ),
        .init(
            id: "aans-aneurysm",
            title: "Cerebral Aneurysm",
            organization: "American Association of Neurological Surgeons",
            url: URL(string: "https://www.aans.org/patients/conditions-treatments/cerebral-aneurysm/")!,
            useInApp: "Cerebrovascular and endovascular neurosurgical pathway."
        ),
        .init(
            id: "aaos-cauda-equina",
            title: "Cauda Equina Syndrome",
            organization: "American Academy of Orthopaedic Surgeons",
            url: URL(string: "https://orthoinfo.aaos.org/en/diseases--conditions/cauda-equina-syndrome/")!,
            useInApp: "Emergency spine-compression pathway."
        ),
        .init(
            id: "aha-heart-attack",
            title: "Warning Signs of a Heart Attack",
            organization: "American Heart Association",
            url: URL(string: "https://www.heart.org/en/health-topics/heart-attack/warning-signs-of-a-heart-attack")!,
            useInApp: "Emergency chest-pain warning pathway."
        ),
        .init(
            id: "acc-coronary",
            title: "Coronary Interventions Handbook",
            organization: "American College of Cardiology",
            url: URL(string: "https://www.acc.org/membership/features/coronary-interventions-handbook")!,
            useInApp: "Interventional-cardiology practice context; not a referral or procedure-eligibility rule."
        ),
        .init(
            id: "hrs-arrhythmia",
            title: "Heart Rhythm Society Clinical Resources",
            organization: "Heart Rhythm Society",
            url: URL(string: "https://www.hrsonline.org/guidance/clinical-resources")!,
            useInApp: "Electrophysiology specialty context."
        ),
        .init(
            id: "acg-dysphagia",
            title: "Food Impaction and Evaluation for Esophageal Disease",
            organization: "American College of Gastroenterology",
            url: URL(string: "https://gi.org/media/press-info-scientific-meeting/featured-science/oral-46-real-world-study-of-biopsy-practices-during-food-impactions-in-the-emergency-department-multi-state-gi-practice/")!,
            useInApp: "Gastroenterology and endoscopy pathway for swallowing/food-impaction symptoms."
        ),
        .init(
            id: "acg-gi-bleed",
            title: "Management of Patients With Acute Lower Gastrointestinal Bleeding",
            organization: "American College of Gastroenterology",
            url: URL(string: "https://acgcdn.gi.org/wp-content/uploads/2016/03/ACGGuideline-Acute-Lower-GI-Bleeding-03012016.pdf")!,
            useInApp: "Acute gastrointestinal-bleeding pathway."
        ),
        .init(
            id: "aasld-liver",
            title: "How to Approach Elevated Liver Enzymes",
            organization: "American Association for the Study of Liver Diseases",
            url: URL(string: "https://www.aasld.org/liver-fellow-network/core-series/back-basics/how-approach-elevated-liver-enzymes")!,
            useInApp: "Gastroenterology/hepatology work-up context."
        ),
        .init(
            id: "nci-cancer-care",
            title: "Finding Cancer Care",
            organization: "National Cancer Institute",
            url: URL(string: "https://www.cancer.gov/about-cancer/managing-care/finding-cancer-care")!,
            useInApp: "Medical oncology, hematology, surgery, and radiation-oncology team context."
        ),
        .init(
            id: "nci-cancer-symptoms",
            title: "Symptoms of Cancer",
            organization: "National Cancer Institute",
            url: URL(string: "https://www.cancer.gov/about-cancer/diagnosis-staging/symptoms")!,
            useInApp: "General evaluation context for persistent, unexplained symptoms; the source notes that such symptoms often have non-cancer causes."
        ),
        .init(
            id: "acog-abnormal-bleeding",
            title: "Abnormal Uterine Bleeding",
            organization: "American College of Obstetricians and Gynecologists",
            url: URL(string: "https://www.acog.org/womens-health/faqs/abnormal-uterine-bleeding")!,
            useInApp: "Obstetrics and gynecology evaluation and emergency warning pathway."
        ),
        .init(
            id: "acog-infertility",
            title: "Infertility: Disparities and Access to Services",
            organization: "American College of Obstetricians and Gynecologists",
            url: URL(string: "https://www.acog.org/clinical/clinical-guidance/committee-statement/articles/2025/01/infertility-disparities-and-access-to-services")!,
            useInApp: "Reproductive endocrinology and infertility referral context."
        ),
        .init(
            id: "aao-retina",
            title: "Detached Retina",
            organization: "American Academy of Ophthalmology",
            url: URL(string: "https://www.aao.org/eye-health/diseases/detached-torn-retina")!,
            useInApp: "Urgent ophthalmology/retina pathway."
        ),
        .init(
            id: "aad-moles",
            title: "Moles: Signs and Symptoms",
            organization: "American Academy of Dermatology",
            url: URL(string: "https://www.aad.org/public/diseases/a-z/moles-symptoms")!,
            useInApp: "Dermatology pathway for a changing or suspicious pigmented lesion."
        ),
        .init(
            id: "aua-hematuria",
            title: "Microhematuria Guideline",
            organization: "American Urological Association",
            url: URL(string: "https://www.auanet.org/guidelines-and-quality/guidelines/microhematuria")!,
            useInApp: "Urology evaluation context for blood in urine."
        ),
        .init(
            id: "acr-rheumatoid-arthritis",
            title: "Rheumatoid Arthritis",
            organization: "American College of Rheumatology",
            url: URL(string: "https://rheumatology.org/patients/rheumatoid-arthritis")!,
            useInApp: "Rheumatology evaluation context for persistent inflammatory joint symptoms."
        ),
        .init(
            id: "cdc-seizure-first-aid",
            title: "First Aid for Seizures",
            organization: "Centers for Disease Control and Prevention",
            url: URL(string: "https://www.cdc.gov/epilepsy/first-aid-for-seizures/index.html")!,
            useInApp: "Emergency-warning and neurology/epilepsy pathway for a seizure or preliminary seizure diagnosis."
        ),
        .init(
            id: "nimh-find-help",
            title: "Help for Mental Illnesses",
            organization: "National Institute of Mental Health",
            url: URL(string: "https://www.nimh.nih.gov/health/find-help")!,
            useInApp: "Immediate-crisis and mental-health-care context."
        ),
        .init(
            id: "nidcd-sudden-deafness",
            title: "Sudden Deafness",
            organization: "National Institute on Deafness and Other Communication Disorders",
            url: URL(string: "https://www.nidcd.nih.gov/health/sudden-deafness")!,
            useInApp: "Medical-emergency context for sudden sensorineural hearing-loss symptoms and otolaryngology referral context."
        ),
        .init(
            id: "nhlbi-asthma-diagnosis",
            title: "Asthma: Diagnosis",
            organization: "National Heart, Lung, and Blood Institute",
            url: URL(string: "https://www.nhlbi.nih.gov/health/asthma/diagnosis")!,
            useInApp: "Pulmonology/allergy evaluation context for a preliminary asthma diagnosis or recurring wheeze."
        ),
        .init(
            id: "niddk-kidney-stones",
            title: "Symptoms & Causes of Kidney Stones",
            organization: "National Institute of Diabetes and Digestive and Kidney Diseases",
            url: URL(string: "https://www.niddk.nih.gov/health-information/urologic-diseases/kidney-stones/symptoms-causes")!,
            useInApp: "Prompt clinician-evaluation and urology pathway for possible kidney stones."
        ),
        .init(
            id: "niddk-ckd",
            title: "What Is Chronic Kidney Disease in Adults?",
            organization: "National Institute of Diabetes and Digestive and Kidney Diseases",
            url: URL(string: "https://www.niddk.nih.gov/health-information/kidney-disease/chronic-kidney-disease-ckd/what-is-chronic-kidney-disease")!,
            useInApp: "Nephrology evaluation context for chronic kidney disease and kidney-function findings."
        ),
        .init(
            id: "ata-thyroid-nodules",
            title: "Thyroid Nodules",
            organization: "American Thyroid Association",
            url: URL(string: "https://www.thyroid.org/thyroid-nodules/")!,
            useInApp: "Endocrinology and endocrine-surgery evaluation context for a thyroid nodule or abnormal thyroid finding."
        ),
        .init(
            id: "nci-breast-symptoms",
            title: "Breast Cancer Signs and Symptoms",
            organization: "National Cancer Institute",
            url: URL(string: "https://www.cancer.gov/types/breast/symptoms")!,
            useInApp: "Prompt clinician-evaluation and breast-imaging/surgery context for a breast lump, abnormal mammogram, or concerning breast change."
        ),
        .init(
            id: "acog-preeclampsia",
            title: "Preeclampsia and High Blood Pressure During Pregnancy",
            organization: "American College of Obstetricians and Gynecologists",
            url: URL(string: "https://www.acog.org/womens-health/faqs/preeclampsia-and-high-blood-pressure-during-pregnancy")!,
            useInApp: "Urgent obstetric evaluation context for possible preeclampsia warning symptoms."
        ),
        .init(
            id: "ninds-migraine",
            title: "Migraine Information Page",
            organization: "National Institute of Neurological Disorders and Stroke",
            url: URL(string: "https://www.ninds.nih.gov/Disorders/All-Disorders/Migraine-Information-Page")!,
            useInApp: "Neurology/headache-medicine context for a preliminary migraine diagnosis; acute neurologic warning signs remain separate emergency pathways."
        ),
        .init(
            id: "aaos-acl-injuries",
            title: "The Management of Anterior Cruciate Ligament Injuries",
            organization: "American Academy of Orthopaedic Surgeons",
            url: URL(string: "https://orthoinfo.aaos.org/globalassets/pdfs/pls_acl-injuries_7.28.23.pdf")!,
            useInApp: "Orthopaedic sports-medicine pathway for a preliminary ACL injury or acute knee-instability finding."
        ),
        .init(
            id: "nhlbi-sleep-apnea",
            title: "Sleep Apnea: Symptoms",
            organization: "National Heart, Lung, and Blood Institute",
            url: URL(string: "https://www.nhlbi.nih.gov/health/sleep-apnea/symptoms")!,
            useInApp: "Sleep-medicine evaluation context for possible sleep-apnea symptoms and preliminary diagnoses."
        ),
        .init(
            id: "cdc-vte",
            title: "About Venous Thromboembolism (Blood Clots)",
            organization: "Centers for Disease Control and Prevention",
            url: URL(string: "https://www.cdc.gov/blood-clots/about/")!,
            useInApp: "Prompt/emergency warning context for deep-vein thrombosis or pulmonary embolism symptoms and preliminary diagnoses."
        ),
        .init(
            id: "nhs-inform-az",
            title: "A to Z List of Common Illnesses and Conditions",
            organization: "NHS Inform / NHS 24",
            url: URL(string: "https://www.nhsinform.scot/illnesses-and-conditions/a-to-z/")!,
            useInApp: "Condition-title source for the 479 imported A–Z entries. The app’s broad candidate-service map does not turn an index label into a diagnosis, urgency classification, or referral order."
        )
    ]

    private static let coreRules: [RoutingRule] = [
        .init(
            id: "acute-stroke",
            title: "Possible acute stroke or TIA",
            requiredSymptoms: [.suddenOneSidedWeakness, .newSpeechDifficulty, .facialDroop, .suddenVisionLoss],
            diagnosisTerms: ["stroke", "tia", "transient ischemic attack", "large vessel occlusion"],
            urgency: .emergency,
            rationale: "Sudden focal neurological changes require emergency evaluation. The definitive destination and whether an endovascular procedure is relevant depend on examination and imaging by the stroke team.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "stroke-ed", specialty: "Emergency Medicine", subspecialty: "Emergency stroke evaluation", role: "Immediate triage, imaging, and coordination."),
                .init(id: "stroke-neuro", specialty: "Neurology", subspecialty: "Vascular Neurology / Stroke", role: "Stroke diagnosis, acute treatment, and prevention planning."),
                .init(id: "stroke-endo", specialty: "Neurological Surgery", subspecialty: "Cerebrovascular / Endovascular Neurosurgery", role: "Potential procedure-team involvement only after emergency imaging and local stroke-system assessment.")
            ],
            sourceIDs: ["cdc-stroke", "aha-acute-stroke", "abms-taxonomy"]
        ),
        .init(
            id: "cerebrovascular-aneurysm",
            title: "Possible aneurysm, AVM, or subarachnoid hemorrhage",
            requiredSymptoms: [.thunderclapHeadache],
            diagnosisTerms: ["cerebral aneurysm", "intracranial aneurysm", "brain aneurysm", "subarachnoid hemorrhage", "sah", "avm", "arteriovenous malformation"],
            urgency: .emergency,
            rationale: "A sudden severe headache or a preliminary cerebrovascular finding must be assessed emergently. A cerebrovascular team may include open and endovascular specialists; the approach is individualized.",
            careApproach: .surgicalEvaluationLikely,
            recommendations: [
                .init(id: "aneurysm-ed", specialty: "Emergency Medicine", subspecialty: "Neuro-emergency evaluation", role: "Immediate stabilization and imaging."),
                .init(id: "aneurysm-neurosurgery", specialty: "Neurological Surgery", subspecialty: "Cerebrovascular Neurosurgery", role: "Open surgical and multidisciplinary cerebrovascular assessment."),
                .init(id: "aneurysm-endo", specialty: "Neurological Surgery / Radiology", subspecialty: "Endovascular Neurosurgery / Neurointerventional", role: "Catheter-based treatment expertise when the treating team finds it appropriate.")
            ],
            sourceIDs: ["aans-aneurysm", "abms-taxonomy"]
        ),
        .init(
            id: "spine-compression",
            title: "Possible spinal cord or cauda equina compression",
            requiredSymptoms: [.severeBackPainWithWeakness, .newBowelBladderChange],
            diagnosisTerms: ["cauda equina", "spinal cord compression", "myelopathy", "epidural abscess"],
            urgency: .emergency,
            rationale: "New weakness or bowel/bladder changes with spine symptoms need immediate assessment. The treating emergency and spine team determines whether neurosurgery, orthopaedic spine surgery, or another service leads care.",
            careApproach: .surgicalEvaluationLikely,
            recommendations: [
                .init(id: "spine-ed", specialty: "Emergency Medicine", subspecialty: "Emergency neurologic and spine evaluation", role: "Immediate neurologic assessment and imaging coordination."),
                .init(id: "spine-neurosurgery", specialty: "Neurological Surgery", subspecialty: "Spine Neurosurgery", role: "Spinal cord, nerve-root, and operative spine expertise."),
                .init(id: "spine-orthopedic", specialty: "Orthopaedic Surgery", subspecialty: "Orthopaedic Spine Surgery", role: "Spinal deformity, instability, and operative spine expertise.")
            ],
            sourceIDs: ["aaos-cauda-equina", "abms-taxonomy"]
        ),
        .init(
            id: "acute-coronary",
            title: "Possible acute coronary syndrome",
            requiredSymptoms: [.persistentChestPressure, .shortnessOfBreath],
            diagnosisTerms: ["heart attack", "myocardial infarction", "acute coronary syndrome", "acs", "unstable angina"],
            urgency: .emergency,
            rationale: "Chest pressure and related warning symptoms may be an emergency. Interventional cardiology is not selected from symptoms alone; it is engaged by the emergency/cardiology team when a coronary intervention is clinically indicated.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "acs-ed", specialty: "Emergency Medicine", subspecialty: "Acute cardiac evaluation", role: "Immediate assessment and time-sensitive testing."),
                .init(id: "acs-cardio", specialty: "Cardiology", subspecialty: "Acute coronary care", role: "Medical cardiac assessment and treatment coordination."),
                .init(id: "acs-interventional", specialty: "Cardiology", subspecialty: "Interventional Cardiology", role: "Catheter-based coronary treatment when indicated by the clinical team.")
            ],
            sourceIDs: ["aha-heart-attack", "acc-coronary", "abms-taxonomy"]
        ),
        .init(
            id: "arrhythmia",
            title: "Palpitations or a preliminary rhythm diagnosis",
            requiredSymptoms: [.palpitations, .fainting],
            diagnosisTerms: ["arrhythmia", "atrial fibrillation", "a-fib", "afib", "svt", "ventricular tachycardia", "heart block"],
            urgency: .sameDay,
            rationale: "A clinician decides the appropriate setting based on symptoms, vital signs, and the rhythm finding. Clinical cardiac electrophysiology is a focused cardiology area for rhythm disorders and procedures.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "rhythm-cardiology", specialty: "Cardiology", subspecialty: "General Cardiology", role: "Initial cardiac assessment and diagnostic coordination."),
                .init(id: "rhythm-ep", specialty: "Cardiology", subspecialty: "Clinical Cardiac Electrophysiology", role: "Focused rhythm-disorder, ablation, and device expertise when appropriate.")
            ],
            sourceIDs: ["hrs-arrhythmia", "abms-taxonomy"]
        ),
        .init(
            id: "dysphagia",
            title: "Swallowing difficulty or food impaction",
            requiredSymptoms: [.foodSticking],
            diagnosisTerms: ["dysphagia", "food impaction", "eosinophilic esophagitis", "eoe", "esophageal stricture", "achalasia"],
            urgency: .sameDay,
            rationale: "Persistent swallowing difficulty or food-sticking symptoms require clinical evaluation. An emergency setting may be necessary if food is stuck or breathing is affected; the app cannot make that call.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "dysphagia-gi", specialty: "Gastroenterology", subspecialty: "Esophageal Disorders", role: "Evaluation of esophageal and swallowing conditions."),
                .init(id: "dysphagia-endoscopy", specialty: "Gastroenterology", subspecialty: "Diagnostic / Therapeutic Endoscopy", role: "Endoscopic evaluation or treatment when a clinician identifies an indication.")
            ],
            sourceIDs: ["acg-dysphagia", "abms-taxonomy"]
        ),
        .init(
            id: "gi-bleed",
            title: "Possible gastrointestinal bleeding",
            requiredSymptoms: [.blackOrBloodyStool],
            diagnosisTerms: ["gi bleed", "gastrointestinal bleeding", "hematemesis", "hematochezia", "melena"],
            urgency: .emergency,
            rationale: "Black or bloody stool may signal gastrointestinal bleeding. Evaluation and the need for endoscopic therapy depend on the person’s stability, medications, examination, and testing.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "gibleed-ed", specialty: "Emergency Medicine", subspecialty: "Acute bleeding evaluation", role: "Immediate stabilization and assessment."),
                .init(id: "gibleed-gi", specialty: "Gastroenterology", subspecialty: "Gastrointestinal Bleeding / Endoscopy", role: "Endoscopic diagnostic and treatment expertise when indicated.")
            ],
            sourceIDs: ["acg-gi-bleed", "abms-taxonomy"]
        ),
        .init(
            id: "liver-biliary",
            title: "Jaundice or liver/biliary finding",
            requiredSymptoms: [.jaundice],
            diagnosisTerms: ["elevated liver enzymes", "elevated lft", "cirrhosis", "hepatitis", "biliary obstruction", "common bile duct", "cholestasis"],
            urgency: .prompt,
            rationale: "Liver and biliary abnormalities need clinician-led assessment. The appropriate specialty and urgency depend on the full history, laboratory pattern, imaging, and signs of infection or obstruction.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "liver-gi", specialty: "Gastroenterology", subspecialty: "General Gastroenterology", role: "Diagnostic work-up and coordination."),
                .init(id: "liver-hepatology", specialty: "Gastroenterology", subspecialty: "Transplant Hepatology / Liver Disease", role: "Focused liver-disease expertise when appropriate."),
                .init(id: "liver-advanced", specialty: "Gastroenterology", subspecialty: "Advanced Endoscopy", role: "Biliary/pancreatic endoscopic expertise if the treating team identifies a procedural need.")
            ],
            sourceIDs: ["aasld-liver", "abms-taxonomy"]
        ),
        .init(
            id: "unexplained-weight-loss",
            title: "Unintentional weight loss needs an initial diagnostic evaluation",
            requiredSymptoms: [.unintentionalWeightLoss],
            diagnosisTerms: [],
            urgency: .prompt,
            rationale: "Unintentional weight loss can have many causes. This pathway deliberately starts with a clinician who can assess the whole picture and direct any targeted specialty referral; it does not infer cancer from the symptom.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "weight-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial history, examination, and diagnostic coordination."),
                .init(id: "weight-appropriate", specialty: "Clinician-directed specialty referral", subspecialty: "Depends on findings", role: "A focused specialty is selected after the initial evaluation, rather than from weight change alone.")
            ],
            sourceIDs: ["nci-cancer-symptoms", "abms-taxonomy"]
        ),
        .init(
            id: "known-cancer",
            title: "Known or preliminary cancer/hematologic diagnosis",
            requiredSymptoms: [],
            diagnosisTerms: ["cancer", "malignant", "malignancy", "tumor", "neoplasm", "lymphoma", "leukemia", "myeloma"],
            urgency: .prompt,
            rationale: "Cancer care commonly involves a team. Which specialists are needed depends on the site, pathology, stage, symptoms, and treatment plan—not on this text match alone.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "cancer-medical", specialty: "Internal Medicine", subspecialty: "Medical Oncology", role: "Systemic cancer-treatment planning when appropriate."),
                .init(id: "cancer-heme", specialty: "Internal Medicine", subspecialty: "Hematology", role: "Blood, bone marrow, and lymphatic disease expertise."),
                .init(id: "cancer-surgical", specialty: "Surgery", subspecialty: "Surgical Oncology / Site-specific Surgery", role: "Surgical assessment based on cancer site and resectability."),
                .init(id: "cancer-radiation", specialty: "Radiation Oncology", subspecialty: "Radiation Oncology", role: "Radiation-treatment assessment when appropriate.")
            ],
            sourceIDs: ["nci-cancer-care", "abms-taxonomy"]
        ),
        .init(
            id: "abnormal-uterine-bleeding",
            title: "Abnormal uterine bleeding",
            requiredSymptoms: [.abnormalUterineBleeding],
            diagnosisTerms: ["abnormal uterine bleeding", "heavy menstrual bleeding", "postmenopausal bleeding", "fibroid", "endometrial"],
            urgency: .prompt,
            rationale: "Bleeding patterns must be evaluated in context, including pregnancy possibility, severity, medication use, and age. Heavy bleeding with chest pain, shortness of breath, or lightheadedness is an emergency warning in the cited source.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "aub-obgyn", specialty: "Obstetrics and Gynecology", subspecialty: "General Obstetrics and Gynecology", role: "Initial evaluation of abnormal uterine bleeding."),
                .init(id: "aub-migs", specialty: "Obstetrics and Gynecology", subspecialty: "Minimally Invasive Gynecologic Surgery", role: "Procedure-focused input when a gynecologic condition and treatment plan warrant it.")
            ],
            sourceIDs: ["acog-abnormal-bleeding", "abms-taxonomy"]
        ),
        .init(
            id: "infertility",
            title: "Difficulty conceiving or fertility concern",
            requiredSymptoms: [.difficultyConceiving],
            diagnosisTerms: ["infertility", "recurrent pregnancy loss", "amenorrhea", "irregular cycles", "endometriosis"],
            urgency: .routine,
            rationale: "An OB-GYN can start an infertility evaluation and may refer to reproductive endocrinology and infertility based on the clinical history and work-up.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "fertility-obgyn", specialty: "Obstetrics and Gynecology", subspecialty: "General Obstetrics and Gynecology", role: "Initial evaluation and care coordination."),
                .init(id: "fertility-rei", specialty: "Obstetrics and Gynecology", subspecialty: "Reproductive Endocrinology and Infertility", role: "Focused fertility evaluation and treatment expertise when a referral is appropriate.")
            ],
            sourceIDs: ["acog-infertility", "abms-taxonomy"]
        ),
        .init(
            id: "retinal-warning",
            title: "Possible retinal tear or detachment warning",
            requiredSymptoms: [.flashesFloatersCurtain],
            diagnosisTerms: ["retinal detachment", "retinal tear", "flashes", "new floaters"],
            urgency: .sameDay,
            rationale: "New flashes, many new floaters, or a curtain/shadow in vision warrant urgent eye evaluation. A retina-focused ophthalmologist may be involved after the eye examination.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "retina-ophthalmology", specialty: "Ophthalmology", subspecialty: "Comprehensive Ophthalmology", role: "Urgent eye assessment."),
                .init(id: "retina-specialist", specialty: "Ophthalmology", subspecialty: "Vitreoretinal / Retina", role: "Retinal tear or detachment expertise when the examination supports it.")
            ],
            sourceIDs: ["aao-retina", "abms-taxonomy"]
        ),
        .init(
            id: "suspicious-skin-lesion",
            title: "Changing or suspicious pigmented skin lesion",
            requiredSymptoms: [.changingBleedingMole],
            diagnosisTerms: ["melanoma", "changing mole", "pigmented lesion", "skin cancer"],
            urgency: .prompt,
            rationale: "A changing, bleeding, or unusual mole/spot is a reason to arrange a dermatology assessment. The app does not determine whether a lesion is cancerous.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "skin-derm", specialty: "Dermatology", subspecialty: "Medical Dermatology", role: "Lesion examination and diagnosis."),
                .init(id: "skin-derm-surgery", specialty: "Dermatology", subspecialty: "Dermatologic Surgery", role: "Procedure-focused care if pathology and clinical assessment warrant it.")
            ],
            sourceIDs: ["aad-moles", "abms-taxonomy"]
        ),
        .init(
            id: "hematuria",
            title: "Blood in urine",
            requiredSymptoms: [.bloodInUrine],
            diagnosisTerms: ["hematuria", "blood in urine", "bladder mass", "kidney mass"],
            urgency: .prompt,
            rationale: "Blood in urine has many potential causes and needs clinician-led evaluation. Urology may coordinate a urinary-tract work-up; the right setting depends on symptoms and overall condition.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "hematuria-urology", specialty: "Urology", subspecialty: "General Urology", role: "Urinary-tract evaluation."),
                .init(id: "hematuria-uro-onc", specialty: "Urology", subspecialty: "Urologic Oncology", role: "Cancer-focused expertise only if clinical assessment identifies a related concern.")
            ],
            sourceIDs: ["aua-hematuria", "abms-taxonomy"]
        ),
        .init(
            id: "inflammatory-joint",
            title: "Persistent inflammatory-type joint symptoms",
            requiredSymptoms: [.swollenPainfulJoint],
            diagnosisTerms: ["rheumatoid arthritis", "inflammatory arthritis", "psoriatic arthritis", "gout", "joint effusion"],
            urgency: .prompt,
            rationale: "Persistent joint swelling and pain can have many causes. Rheumatology is a potential service when the clinical assessment suggests an inflammatory or autoimmune joint disease; an examination and tests are needed to distinguish causes.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "joint-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial assessment, testing, and referral coordination."),
                .init(id: "joint-rheumatology", specialty: "Internal Medicine", subspecialty: "Rheumatology", role: "Focused inflammatory and autoimmune joint-disease expertise when appropriate.")
            ],
            sourceIDs: ["acr-rheumatoid-arthritis", "abms-taxonomy"]
        ),
        .init(
            id: "seizure-review",
            title: "Seizure, convulsion, or a preliminary seizure diagnosis",
            requiredSymptoms: [.seizureOrConvulsion],
            diagnosisTerms: ["seizure", "epilepsy", "convulsion", "tonic clonic", "absence seizure"],
            urgency: .sameDay,
            rationale: "A seizure needs prompt clinical assessment. Call emergency services if it is a first seizure, lasts more than five minutes, repeats without recovery, involves breathing difficulty or injury, occurs in water, or happens during pregnancy; the app cannot determine this from a text entry.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "seizure-emergency", specialty: "Emergency Medicine", subspecialty: "Emergency neurologic evaluation", role: "Emergency assessment when the event is active or has emergency warning features."),
                .init(id: "seizure-neurology", specialty: "Neurology", subspecialty: "Epilepsy / Clinical Neurophysiology", role: "Seizure classification, diagnostic work-up, and long-term management when appropriate.")
            ],
            sourceIDs: ["cdc-seizure-first-aid", "abms-taxonomy"]
        ),
        .init(
            id: "mental-health-crisis",
            title: "Immediate mental-health or self-harm safety concern",
            requiredSymptoms: [.thoughtsOfSelfHarm],
            diagnosisTerms: ["suicidal ideation", "suicidal thoughts", "self harm", "self-harm", "suicide attempt"],
            urgency: .emergency,
            rationale: "A current safety concern requires immediate help, not specialty shopping. In the United States, call or text 988 for crisis support; call emergency services or go to an emergency department in a life-threatening situation.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "crisis-emergency", specialty: "Emergency Medicine / Crisis Service", subspecialty: "Immediate safety assessment", role: "Immediate safety assessment and connection to crisis care."),
                .init(id: "crisis-psychiatry", specialty: "Psychiatry", subspecialty: "Emergency / Consultation-Liaison Psychiatry", role: "Urgent psychiatric assessment as arranged by the crisis or emergency team."),
                .init(id: "crisis-behavioral", specialty: "Behavioral Health", subspecialty: "Psychotherapy / Community Mental Health", role: "Ongoing follow-up after immediate safety needs are addressed.")
            ],
            sourceIDs: ["nimh-find-help", "abms-taxonomy"]
        ),
        .init(
            id: "sudden-hearing-loss",
            title: "Sudden hearing loss",
            requiredSymptoms: [.suddenHearingLoss],
            diagnosisTerms: ["sudden sensorineural hearing loss", "sudden deafness", "sshl", "sudden hearing loss"],
            urgency: .sameDay,
            rationale: "Sudden hearing loss is treated as a medical emergency by the cited NIH resource. It needs immediate medical evaluation; a clinician must distinguish inner-ear hearing loss from other causes such as obstruction.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "hearing-urgent", specialty: "Otolaryngology–Head and Neck Surgery", subspecialty: "Otology / Neurotology", role: "Urgent ear and hearing assessment, including audiology coordination."),
                .init(id: "hearing-audiology", specialty: "Audiology", subspecialty: "Diagnostic Audiology", role: "Hearing testing as part of clinician-directed evaluation.")
            ],
            sourceIDs: ["nidcd-sudden-deafness", "abms-taxonomy"]
        ),
        .init(
            id: "asthma-wheeze",
            title: "Preliminary asthma diagnosis or recurrent wheeze",
            requiredSymptoms: [.recurrentWheeze],
            diagnosisTerms: ["asthma", "wheezing", "reactive airway disease", "exercise induced asthma", "allergic asthma"],
            urgency: .prompt,
            rationale: "Recurring wheeze, cough, or chest tightness needs clinician-led assessment. Seek emergency care for severe breathing difficulty or symptoms that do not improve with a prescribed reliever plan; this app cannot judge attack severity.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "asthma-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial assessment, testing, and treatment coordination."),
                .init(id: "asthma-pulmonary", specialty: "Internal Medicine", subspecialty: "Pulmonary Disease", role: "Lung-disease expertise for persistent, complex, or unclear symptoms when referred."),
                .init(id: "asthma-allergy", specialty: "Allergy and Immunology", subspecialty: "Allergic Respiratory Disease", role: "Allergy and immune-trigger evaluation when clinically appropriate.")
            ],
            sourceIDs: ["nhlbi-asthma-diagnosis", "abms-taxonomy"]
        ),
        .init(
            id: "kidney-stone",
            title: "Possible kidney stone or ureteral stone",
            requiredSymptoms: [.flankPainWithUrinarySymptoms],
            diagnosisTerms: ["kidney stone", "nephrolithiasis", "ureteral stone", "renal colic"],
            urgency: .sameDay,
            rationale: "Severe side or back pain with urinary symptoms may need prompt evaluation. Fever, chills, inability to urinate, uncontrolled pain, or a person who appears very unwell may need emergency assessment; the app cannot determine the cause or level of risk.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "stone-emergency", specialty: "Emergency Medicine", subspecialty: "Acute abdominal/flank-pain evaluation", role: "Urgent assessment and imaging when clinically indicated."),
                .init(id: "stone-urology", specialty: "Urology", subspecialty: "Endourology / Stone Disease", role: "Urinary-stone assessment and procedure planning when needed.")
            ],
            sourceIDs: ["niddk-kidney-stones", "abms-taxonomy"]
        ),
        .init(
            id: "chronic-kidney-disease",
            title: "Chronic kidney disease or kidney-function finding",
            requiredSymptoms: [],
            diagnosisTerms: ["chronic kidney disease", "ckd", "reduced egfr", "reduced estimated gfr", "low egfr", "albuminuria", "proteinuria", "renal insufficiency", "kidney failure"],
            urgency: .prompt,
            rationale: "Kidney disease often has no early symptoms and is evaluated with clinical history plus urine and blood testing. The right referral timing depends on the cause, kidney-function trend, complications, and the full medical picture.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "ckd-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Ongoing monitoring, cause evaluation, and referral coordination."),
                .init(id: "ckd-nephrology", specialty: "Internal Medicine", subspecialty: "Nephrology", role: "Kidney-disease diagnosis and management when referred."),
                .init(id: "ckd-transplant", specialty: "Internal Medicine", subspecialty: "Transplant Nephrology", role: "Advanced-kidney-disease and transplant evaluation only when the nephrology team identifies a need.")
            ],
            sourceIDs: ["niddk-ckd", "abms-taxonomy"]
        ),
        .init(
            id: "thyroid-nodule",
            title: "Thyroid nodule or thyroid imaging finding",
            requiredSymptoms: [],
            diagnosisTerms: ["thyroid nodule", "thyroid mass", "thyroid lesion", "thyroid ultrasound", "goiter"],
            urgency: .prompt,
            rationale: "A thyroid nodule needs clinician-directed evaluation; most nodules are not cancer, and blood tests alone may not determine the cause. The appropriate tests and referral depend on examination, imaging, laboratory findings, and symptoms.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "thyroid-endocrinology", specialty: "Internal Medicine", subspecialty: "Endocrinology, Diabetes, and Metabolism", role: "Thyroid-function and nodule evaluation when referred."),
                .init(id: "thyroid-surgery", specialty: "Surgery", subspecialty: "Endocrine Surgery", role: "Surgical assessment only if clinical evaluation identifies a potential indication.")
            ],
            sourceIDs: ["ata-thyroid-nodules", "abms-taxonomy"]
        ),
        .init(
            id: "breast-change",
            title: "Breast change or abnormal breast imaging",
            requiredSymptoms: [.breastLumpOrNippleChange],
            diagnosisTerms: ["breast lump", "breast mass", "abnormal mammogram", "breast calcifications", "nipple discharge", "breast biopsy"],
            urgency: .prompt,
            rationale: "Most breast changes are not cancer, but a new lump, skin/nipple change, discharge, or abnormal mammogram should be followed up with a clinician. The appropriate imaging, biopsy, or specialty team depends on the individual findings.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "breast-clinical", specialty: "Primary Care / Obstetrics and Gynecology", subspecialty: "Clinical breast evaluation", role: "Initial evaluation and referral coordination."),
                .init(id: "breast-radiology", specialty: "Radiology", subspecialty: "Breast Imaging", role: "Diagnostic imaging assessment when ordered by the clinical team."),
                .init(id: "breast-surgery", specialty: "Surgery", subspecialty: "Breast Surgery / Surgical Oncology", role: "Tissue diagnosis and surgical assessment when indicated by findings.")
            ],
            sourceIDs: ["nci-breast-symptoms", "abms-taxonomy"]
        ),
        .init(
            id: "pregnancy-hypertension",
            title: "Possible preeclampsia or pregnancy-related blood-pressure concern",
            requiredSymptoms: [.pregnancyWarningSymptoms],
            diagnosisTerms: ["preeclampsia", "gestational hypertension", "pregnancy hypertension", "postpartum preeclampsia"],
            urgency: .sameDay,
            rationale: "During pregnancy or soon after birth, warning symptoms such as a persistent headache, vision changes, upper-abdominal pain, sudden swelling, nausea/vomiting later in pregnancy, or breathing difficulty need immediate contact with an obstetric clinician. This app cannot determine severity.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "pregnancy-ob", specialty: "Obstetrics and Gynecology", subspecialty: "Obstetric Triage / General Obstetrics", role: "Urgent pregnancy or postpartum assessment."),
                .init(id: "pregnancy-mfm", specialty: "Obstetrics and Gynecology", subspecialty: "Maternal-Fetal Medicine", role: "High-risk pregnancy consultation when the obstetric team identifies a need.")
            ],
            sourceIDs: ["acog-preeclampsia", "abms-taxonomy"]
        ),
        .init(
            id: "pregnancy-hypertension-emergency",
            title: "Preliminary eclampsia or HELLP syndrome",
            requiredSymptoms: [],
            diagnosisTerms: ["eclampsia", "hellp syndrome", "hellp"],
            urgency: .emergency,
            rationale: "Eclampsia and HELLP syndrome are obstetric emergencies. Do not use this app to select a clinic or delay emergency care.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "hellp-emergency", specialty: "Emergency Medicine / Obstetrics", subspecialty: "Obstetric emergency care", role: "Immediate stabilization and obstetric-team coordination."),
                .init(id: "hellp-mfm", specialty: "Obstetrics and Gynecology", subspecialty: "Maternal-Fetal Medicine", role: "High-risk obstetric care as coordinated by the emergency and obstetric teams.")
            ],
            sourceIDs: ["acog-preeclampsia", "abms-taxonomy"]
        ),
        .init(
            id: "migraine",
            title: "Preliminary migraine diagnosis or recurrent migraine-like headaches",
            requiredSymptoms: [.recurrentMigraineLikeHeadache],
            diagnosisTerms: ["migraine", "chronic migraine", "migraine with aura", "vestibular migraine"],
            urgency: .routine,
            rationale: "Migraine is more than a headache and can include recurrent attacks with nausea and sensitivity to light, noise, or smell. New sudden severe headache, new weakness, speech difficulty, or vision loss are handled separately as emergency pathways.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "migraine-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial diagnosis, treatment, and referral coordination."),
                .init(id: "migraine-neurology", specialty: "Neurology", subspecialty: "Headache Medicine", role: "Headache-disorder expertise for persistent, disabling, complex, or uncertain cases when referred.")
            ],
            sourceIDs: ["ninds-migraine", "abms-taxonomy"]
        ),
        .init(
            id: "acl-knee-injury",
            title: "Possible ACL injury or acute knee instability",
            requiredSymptoms: [.acuteKneeInstability],
            diagnosisTerms: ["acl tear", "acl injury", "anterior cruciate ligament", "meniscal tear", "knee instability"],
            urgency: .prompt,
            rationale: "An acute twisting knee injury with swelling, limited motion, or instability needs clinical assessment. Examination and imaging determine whether there is an ACL, meniscus, cartilage, fracture, or other injury and whether surgery is considered.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "knee-orthopedic", specialty: "Orthopaedic Surgery", subspecialty: "Sports Medicine / Knee Surgery", role: "Knee-injury diagnosis and treatment planning."),
                .init(id: "knee-rehab", specialty: "Physical Medicine and Rehabilitation", subspecialty: "Sports and Musculoskeletal Medicine", role: "Nonoperative rehabilitation and return-to-function planning when appropriate.")
            ],
            sourceIDs: ["aaos-acl-injuries", "abms-taxonomy"]
        ),
        .init(
            id: "sleep-apnea",
            title: "Possible sleep apnea or sleep-related breathing disorder",
            requiredSymptoms: [.loudSnoringWithSleepiness],
            diagnosisTerms: ["sleep apnea", "obstructive sleep apnea", "osa", "central sleep apnea", "sleep study abnormal", "abnormal sleep study"],
            urgency: .routine,
            rationale: "Snoring, gasping during sleep, breathing pauses observed by another person, and daytime sleepiness need clinician-led assessment. A sleep study may be needed to diagnose the type and severity; this app cannot diagnose sleep apnea from a symptom.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "sleep-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial assessment and sleep-study referral coordination."),
                .init(id: "sleep-medicine", specialty: "Sleep Medicine", subspecialty: "Sleep-Related Breathing Disorders", role: "Sleep-study interpretation and treatment planning when referred."),
                .init(id: "sleep-otolaryngology", specialty: "Otolaryngology–Head and Neck Surgery", subspecialty: "Sleep Surgery / Airway Evaluation", role: "Airway and surgical evaluation only when indicated by the treating sleep team.")
            ],
            sourceIDs: ["nhlbi-sleep-apnea", "abms-taxonomy"]
        ),
        .init(
            id: "possible-dvt",
            title: "Possible deep-vein thrombosis",
            requiredSymptoms: [.oneSidedLegSwellingPain],
            diagnosisTerms: ["deep vein thrombosis", "dvt", "venous thromboembolism"],
            urgency: .sameDay,
            rationale: "One-sided leg swelling, pain, warmth, or discoloration can have several causes and needs prompt clinical evaluation. New breathing difficulty, chest pain, coughing blood, fainting, or a preliminary pulmonary-embolism diagnosis require emergency help.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "dvt-emergency", specialty: "Emergency Medicine", subspecialty: "Acute vascular evaluation", role: "Time-sensitive evaluation and testing when clinically indicated."),
                .init(id: "dvt-hematology", specialty: "Internal Medicine", subspecialty: "Hematology", role: "Clotting-disorder and anticoagulation expertise when the treating team identifies a need.")
            ],
            sourceIDs: ["cdc-vte", "abms-taxonomy"]
        ),
        .init(
            id: "pulmonary-embolism",
            title: "Preliminary pulmonary embolism diagnosis",
            requiredSymptoms: [],
            diagnosisTerms: ["pulmonary embolism", "venous thromboembolism with pe"],
            urgency: .emergency,
            rationale: "A preliminary pulmonary-embolism diagnosis requires immediate medical care. Do not use the specialty list to select a clinic or delay emergency assessment.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "pe-emergency", specialty: "Emergency Medicine", subspecialty: "Acute cardiopulmonary evaluation", role: "Immediate stabilization, testing, and treatment coordination."),
                .init(id: "pe-pulmonary", specialty: "Internal Medicine", subspecialty: "Pulmonary Disease / Critical Care Medicine", role: "Pulmonary and critical-care involvement as determined by the acute-care team."),
                .init(id: "pe-hematology", specialty: "Internal Medicine", subspecialty: "Hematology", role: "Thrombosis and anticoagulation expertise when appropriate after acute evaluation.")
            ],
            sourceIDs: ["cdc-vte", "abms-taxonomy"]
        )
    ]

    static let rules: [RoutingRule] = coreRules + NHSInformSpecialtyMappings.rules

    static let sourceByID = Dictionary(uniqueKeysWithValues: sources.map { ($0.id, $0) })

    /// Curated phrases accepted by the routing engine. These are deliberately limited to
    /// source-backed, clinician-entered preliminary findings and diagnoses represented in rules.
    static let corePreliminaryDiagnoses: [PreliminaryDiagnosis] = [
        .init(id: "ischemic-stroke", title: "Acute ischemic stroke", group: "Brain & neurovascular", aliases: ["stroke"], routeIDs: ["acute-stroke"], sourceIDs: ["cdc-stroke", "aha-acute-stroke"]),
        .init(id: "tia", title: "Transient ischemic attack (TIA)", group: "Brain & neurovascular", aliases: ["TIA"], routeIDs: ["acute-stroke"], sourceIDs: ["cdc-stroke", "aha-acute-stroke"]),
        .init(id: "large-vessel-occlusion", title: "Large-vessel occlusion", group: "Brain & neurovascular", aliases: ["LVO"], routeIDs: ["acute-stroke"], sourceIDs: ["aha-acute-stroke"]),
        .init(id: "intracranial-aneurysm", title: "Intracranial aneurysm", group: "Brain & neurovascular", aliases: ["cerebral aneurysm"], routeIDs: ["cerebrovascular-aneurysm"], sourceIDs: ["aans-aneurysm"]),
        .init(id: "subarachnoid-hemorrhage", title: "Subarachnoid hemorrhage", group: "Brain & neurovascular", aliases: ["SAH"], routeIDs: ["cerebrovascular-aneurysm"], sourceIDs: ["aans-aneurysm"]),
        .init(id: "brain-avm", title: "Arteriovenous malformation (AVM)", group: "Brain & neurovascular", aliases: ["AVM"], routeIDs: ["cerebrovascular-aneurysm"], sourceIDs: ["aans-aneurysm"]),

        .init(id: "cauda-equina", title: "Cauda equina syndrome", group: "Spine & nerves", aliases: ["cauda equina"], routeIDs: ["spine-compression"], sourceIDs: ["aaos-cauda-equina"]),
        .init(id: "spinal-cord-compression", title: "Spinal cord compression", group: "Spine & nerves", aliases: [], routeIDs: ["spine-compression"], sourceIDs: ["aaos-cauda-equina"]),
        .init(id: "myelopathy", title: "Myelopathy", group: "Spine & nerves", aliases: [], routeIDs: ["spine-compression"], sourceIDs: ["aaos-cauda-equina"]),
        .init(id: "epidural-abscess", title: "Epidural abscess", group: "Spine & nerves", aliases: [], routeIDs: ["spine-compression"], sourceIDs: ["aaos-cauda-equina"]),

        .init(id: "acute-coronary-syndrome", title: "Acute coronary syndrome", group: "Heart rhythm & coronary", aliases: ["ACS"], routeIDs: ["acute-coronary"], sourceIDs: ["aha-heart-attack", "acc-coronary"]),
        .init(id: "myocardial-infarction", title: "Myocardial infarction", group: "Heart rhythm & coronary", aliases: ["heart attack", "MI"], routeIDs: ["acute-coronary"], sourceIDs: ["aha-heart-attack", "acc-coronary"]),
        .init(id: "unstable-angina", title: "Unstable angina", group: "Heart rhythm & coronary", aliases: [], routeIDs: ["acute-coronary"], sourceIDs: ["aha-heart-attack", "acc-coronary"]),
        .init(id: "atrial-fibrillation", title: "Atrial fibrillation", group: "Heart rhythm & coronary", aliases: ["AFib", "A-fib"], routeIDs: ["arrhythmia"], sourceIDs: ["hrs-arrhythmia"]),
        .init(id: "svt", title: "Supraventricular tachycardia (SVT)", group: "Heart rhythm & coronary", aliases: ["SVT"], routeIDs: ["arrhythmia"], sourceIDs: ["hrs-arrhythmia"]),
        .init(id: "ventricular-tachycardia", title: "Ventricular tachycardia", group: "Heart rhythm & coronary", aliases: ["VT"], routeIDs: ["arrhythmia"], sourceIDs: ["hrs-arrhythmia"]),
        .init(id: "heart-block", title: "Heart block", group: "Heart rhythm & coronary", aliases: [], routeIDs: ["arrhythmia"], sourceIDs: ["hrs-arrhythmia"]),

        .init(id: "dysphagia", title: "Dysphagia", group: "Digestive & liver", aliases: ["trouble swallowing"], routeIDs: ["dysphagia"], sourceIDs: ["acg-dysphagia"]),
        .init(id: "food-impaction", title: "Esophageal food impaction", group: "Digestive & liver", aliases: ["food impaction"], routeIDs: ["dysphagia"], sourceIDs: ["acg-dysphagia"]),
        .init(id: "eoe", title: "Eosinophilic esophagitis", group: "Digestive & liver", aliases: ["EoE"], routeIDs: ["dysphagia"], sourceIDs: ["acg-dysphagia"]),
        .init(id: "esophageal-stricture", title: "Esophageal stricture", group: "Digestive & liver", aliases: [], routeIDs: ["dysphagia"], sourceIDs: ["acg-dysphagia"]),
        .init(id: "achalasia", title: "Achalasia", group: "Digestive & liver", aliases: [], routeIDs: ["dysphagia"], sourceIDs: ["acg-dysphagia"]),
        .init(id: "gi-bleeding", title: "Gastrointestinal bleeding", group: "Digestive & liver", aliases: ["GI bleed"], routeIDs: ["gi-bleed"], sourceIDs: ["acg-gi-bleed"]),
        .init(id: "hematemesis", title: "Hematemesis", group: "Digestive & liver", aliases: [], routeIDs: ["gi-bleed"], sourceIDs: ["acg-gi-bleed"]),
        .init(id: "hematochezia", title: "Hematochezia", group: "Digestive & liver", aliases: [], routeIDs: ["gi-bleed"], sourceIDs: ["acg-gi-bleed"]),
        .init(id: "melena", title: "Melena", group: "Digestive & liver", aliases: [], routeIDs: ["gi-bleed"], sourceIDs: ["acg-gi-bleed"]),
        .init(id: "elevated-liver-enzymes", title: "Elevated liver enzymes", group: "Digestive & liver", aliases: ["elevated LFTs"], routeIDs: ["liver-biliary"], sourceIDs: ["aasld-liver"]),
        .init(id: "cirrhosis", title: "Cirrhosis", group: "Digestive & liver", aliases: [], routeIDs: ["liver-biliary"], sourceIDs: ["aasld-liver"]),
        .init(id: "hepatitis", title: "Hepatitis", group: "Digestive & liver", aliases: [], routeIDs: ["liver-biliary"], sourceIDs: ["aasld-liver"]),
        .init(id: "biliary-obstruction", title: "Biliary obstruction", group: "Digestive & liver", aliases: [], routeIDs: ["liver-biliary"], sourceIDs: ["aasld-liver"]),
        .init(id: "cholestasis", title: "Cholestasis", group: "Digestive & liver", aliases: [], routeIDs: ["liver-biliary"], sourceIDs: ["aasld-liver"]),

        .init(id: "solid-tumor", title: "Preliminary malignancy or tumor finding", group: "Cancer & hematology", aliases: ["tumor", "malignancy", "neoplasm"], routeIDs: ["known-cancer"], sourceIDs: ["nci-cancer-care"]),
        .init(id: "lymphoma", title: "Lymphoma", group: "Cancer & hematology", aliases: [], routeIDs: ["known-cancer"], sourceIDs: ["nci-cancer-care"]),
        .init(id: "leukemia", title: "Leukemia", group: "Cancer & hematology", aliases: [], routeIDs: ["known-cancer"], sourceIDs: ["nci-cancer-care"]),
        .init(id: "multiple-myeloma", title: "Multiple myeloma", group: "Cancer & hematology", aliases: ["myeloma"], routeIDs: ["known-cancer"], sourceIDs: ["nci-cancer-care"]),

        .init(id: "aub", title: "Abnormal uterine bleeding", group: "Reproductive & urinary", aliases: ["AUB"], routeIDs: ["abnormal-uterine-bleeding"], sourceIDs: ["acog-abnormal-bleeding"]),
        .init(id: "heavy-menstrual-bleeding", title: "Heavy menstrual bleeding", group: "Reproductive & urinary", aliases: [], routeIDs: ["abnormal-uterine-bleeding"], sourceIDs: ["acog-abnormal-bleeding"]),
        .init(id: "postmenopausal-bleeding", title: "Postmenopausal bleeding", group: "Reproductive & urinary", aliases: [], routeIDs: ["abnormal-uterine-bleeding"], sourceIDs: ["acog-abnormal-bleeding"]),
        .init(id: "uterine-fibroid", title: "Uterine fibroid", group: "Reproductive & urinary", aliases: ["fibroid"], routeIDs: ["abnormal-uterine-bleeding"], sourceIDs: ["acog-abnormal-bleeding"]),
        .init(id: "endometriosis", title: "Endometriosis", group: "Reproductive & urinary", aliases: [], routeIDs: ["infertility"], sourceIDs: ["acog-infertility"]),
        .init(id: "infertility", title: "Infertility", group: "Reproductive & urinary", aliases: [], routeIDs: ["infertility"], sourceIDs: ["acog-infertility"]),
        .init(id: "recurrent-pregnancy-loss", title: "Recurrent pregnancy loss", group: "Reproductive & urinary", aliases: [], routeIDs: ["infertility"], sourceIDs: ["acog-infertility"]),
        .init(id: "amenorrhea", title: "Amenorrhea", group: "Reproductive & urinary", aliases: [], routeIDs: ["infertility"], sourceIDs: ["acog-infertility"]),
        .init(id: "hematuria", title: "Hematuria", group: "Reproductive & urinary", aliases: ["blood in urine"], routeIDs: ["hematuria"], sourceIDs: ["aua-hematuria"]),
        .init(id: "bladder-mass", title: "Bladder mass", group: "Reproductive & urinary", aliases: [], routeIDs: ["hematuria"], sourceIDs: ["aua-hematuria"]),
        .init(id: "kidney-mass", title: "Kidney mass", group: "Reproductive & urinary", aliases: ["renal mass"], routeIDs: ["hematuria"], sourceIDs: ["aua-hematuria"]),

        .init(id: "retinal-tear", title: "Retinal tear", group: "Eye & skin", aliases: [], routeIDs: ["retinal-warning"], sourceIDs: ["aao-retina"]),
        .init(id: "retinal-detachment", title: "Retinal detachment", group: "Eye & skin", aliases: [], routeIDs: ["retinal-warning"], sourceIDs: ["aao-retina"]),
        .init(id: "melanoma", title: "Melanoma", group: "Eye & skin", aliases: [], routeIDs: ["suspicious-skin-lesion"], sourceIDs: ["aad-moles"]),
        .init(id: "pigmented-lesion", title: "Suspicious pigmented lesion", group: "Eye & skin", aliases: ["changing mole"], routeIDs: ["suspicious-skin-lesion"], sourceIDs: ["aad-moles"]),

        .init(id: "rheumatoid-arthritis", title: "Rheumatoid arthritis", group: "Joints & autoimmune", aliases: ["RA"], routeIDs: ["inflammatory-joint"], sourceIDs: ["acr-rheumatoid-arthritis"]),
        .init(id: "inflammatory-arthritis", title: "Inflammatory arthritis", group: "Joints & autoimmune", aliases: [], routeIDs: ["inflammatory-joint"], sourceIDs: ["acr-rheumatoid-arthritis"]),
        .init(id: "psoriatic-arthritis", title: "Psoriatic arthritis", group: "Joints & autoimmune", aliases: [], routeIDs: ["inflammatory-joint"], sourceIDs: ["acr-rheumatoid-arthritis"]),
        .init(id: "gout", title: "Gout", group: "Joints & autoimmune", aliases: [], routeIDs: ["inflammatory-joint"], sourceIDs: ["acr-rheumatoid-arthritis"]),
        .init(id: "joint-effusion", title: "Joint effusion", group: "Joints & autoimmune", aliases: [], routeIDs: ["inflammatory-joint"], sourceIDs: ["acr-rheumatoid-arthritis"]),

        .init(id: "seizure", title: "Seizure", group: "Brain & neurovascular", aliases: ["convulsion"], routeIDs: ["seizure-review"], sourceIDs: ["cdc-seizure-first-aid"]),
        .init(id: "epilepsy", title: "Epilepsy", group: "Brain & neurovascular", aliases: [], routeIDs: ["seizure-review"], sourceIDs: ["cdc-seizure-first-aid"]),
        .init(id: "tonic-clonic-seizure", title: "Tonic-clonic seizure", group: "Brain & neurovascular", aliases: ["generalized seizure"], routeIDs: ["seizure-review"], sourceIDs: ["cdc-seizure-first-aid"]),
        .init(id: "migraine", title: "Migraine", group: "Brain & neurovascular", aliases: [], routeIDs: ["migraine"], sourceIDs: ["ninds-migraine"]),
        .init(id: "chronic-migraine", title: "Chronic migraine", group: "Brain & neurovascular", aliases: [], routeIDs: ["migraine"], sourceIDs: ["ninds-migraine"]),
        .init(id: "migraine-with-aura", title: "Migraine with aura", group: "Brain & neurovascular", aliases: ["aura"], routeIDs: ["migraine"], sourceIDs: ["ninds-migraine"]),
        .init(id: "vestibular-migraine", title: "Vestibular migraine", group: "Brain & neurovascular", aliases: [], routeIDs: ["migraine"], sourceIDs: ["ninds-migraine"]),

        .init(id: "suicidal-ideation", title: "Suicidal ideation", group: "Mental health & safety", aliases: ["suicidal thoughts"], routeIDs: ["mental-health-crisis"], sourceIDs: ["nimh-find-help"]),
        .init(id: "self-harm", title: "Self-harm concern", group: "Mental health & safety", aliases: ["self harm"], routeIDs: ["mental-health-crisis"], sourceIDs: ["nimh-find-help"]),
        .init(id: "suicide-attempt", title: "Suicide attempt", group: "Mental health & safety", aliases: [], routeIDs: ["mental-health-crisis"], sourceIDs: ["nimh-find-help"]),

        .init(id: "sudden-sensorineural-hearing-loss", title: "Sudden sensorineural hearing loss", group: "Ear, nose & throat", aliases: ["SSHL", "sudden deafness"], routeIDs: ["sudden-hearing-loss"], sourceIDs: ["nidcd-sudden-deafness"]),
        .init(id: "sudden-hearing-loss", title: "Sudden hearing loss", group: "Ear, nose & throat", aliases: [], routeIDs: ["sudden-hearing-loss"], sourceIDs: ["nidcd-sudden-deafness"]),

        .init(id: "asthma", title: "Asthma", group: "Breathing & sleep", aliases: [], routeIDs: ["asthma-wheeze"], sourceIDs: ["nhlbi-asthma-diagnosis"]),
        .init(id: "reactive-airway-disease", title: "Reactive airway disease", group: "Breathing & sleep", aliases: [], routeIDs: ["asthma-wheeze"], sourceIDs: ["nhlbi-asthma-diagnosis"]),
        .init(id: "allergic-asthma", title: "Allergic asthma", group: "Breathing & sleep", aliases: [], routeIDs: ["asthma-wheeze"], sourceIDs: ["nhlbi-asthma-diagnosis"]),
        .init(id: "obstructive-sleep-apnea", title: "Obstructive sleep apnea", group: "Breathing & sleep", aliases: ["OSA"], routeIDs: ["sleep-apnea"], sourceIDs: ["nhlbi-sleep-apnea"]),
        .init(id: "central-sleep-apnea", title: "Central sleep apnea", group: "Breathing & sleep", aliases: [], routeIDs: ["sleep-apnea"], sourceIDs: ["nhlbi-sleep-apnea"]),
        .init(id: "abnormal-sleep-study", title: "Abnormal sleep-study finding", group: "Breathing & sleep", aliases: [], routeIDs: ["sleep-apnea"], sourceIDs: ["nhlbi-sleep-apnea"]),

        .init(id: "kidney-stone", title: "Kidney stone", group: "Kidney & urinary", aliases: ["renal stone"], routeIDs: ["kidney-stone"], sourceIDs: ["niddk-kidney-stones"]),
        .init(id: "nephrolithiasis", title: "Nephrolithiasis", group: "Kidney & urinary", aliases: [], routeIDs: ["kidney-stone"], sourceIDs: ["niddk-kidney-stones"]),
        .init(id: "ureteral-stone", title: "Ureteral stone", group: "Kidney & urinary", aliases: [], routeIDs: ["kidney-stone"], sourceIDs: ["niddk-kidney-stones"]),
        .init(id: "renal-colic", title: "Renal colic", group: "Kidney & urinary", aliases: [], routeIDs: ["kidney-stone"], sourceIDs: ["niddk-kidney-stones"]),
        .init(id: "chronic-kidney-disease", title: "Chronic kidney disease", group: "Kidney & urinary", aliases: ["CKD"], routeIDs: ["chronic-kidney-disease"], sourceIDs: ["niddk-ckd"]),
        .init(id: "reduced-egfr", title: "Reduced estimated GFR", group: "Kidney & urinary", aliases: ["low eGFR"], routeIDs: ["chronic-kidney-disease"], sourceIDs: ["niddk-ckd"]),
        .init(id: "albuminuria", title: "Albuminuria", group: "Kidney & urinary", aliases: [], routeIDs: ["chronic-kidney-disease"], sourceIDs: ["niddk-ckd"]),
        .init(id: "proteinuria", title: "Proteinuria", group: "Kidney & urinary", aliases: [], routeIDs: ["chronic-kidney-disease"], sourceIDs: ["niddk-ckd"]),
        .init(id: "kidney-failure", title: "Kidney failure", group: "Kidney & urinary", aliases: ["renal failure"], routeIDs: ["chronic-kidney-disease"], sourceIDs: ["niddk-ckd"]),
        .init(id: "deep-vein-thrombosis", title: "Deep-vein thrombosis", group: "Vascular & blood", aliases: ["DVT"], routeIDs: ["possible-dvt"], sourceIDs: ["cdc-vte"]),
        .init(id: "venous-thromboembolism", title: "Venous thromboembolism", group: "Vascular & blood", aliases: ["VTE"], routeIDs: ["possible-dvt"], sourceIDs: ["cdc-vte"]),
        .init(id: "pulmonary-embolism", title: "Pulmonary embolism", group: "Vascular & blood", aliases: ["PE"], routeIDs: ["pulmonary-embolism"], sourceIDs: ["cdc-vte"]),

        .init(id: "thyroid-nodule", title: "Thyroid nodule", group: "Hormones & metabolism", aliases: [], routeIDs: ["thyroid-nodule"], sourceIDs: ["ata-thyroid-nodules"]),
        .init(id: "thyroid-mass", title: "Thyroid mass", group: "Hormones & metabolism", aliases: [], routeIDs: ["thyroid-nodule"], sourceIDs: ["ata-thyroid-nodules"]),
        .init(id: "thyroid-lesion", title: "Thyroid lesion", group: "Hormones & metabolism", aliases: [], routeIDs: ["thyroid-nodule"], sourceIDs: ["ata-thyroid-nodules"]),
        .init(id: "goiter", title: "Goiter", group: "Hormones & metabolism", aliases: ["thyroid enlargement"], routeIDs: ["thyroid-nodule"], sourceIDs: ["ata-thyroid-nodules"]),

        .init(id: "breast-lump", title: "Breast lump", group: "Breast & oncology", aliases: ["breast mass"], routeIDs: ["breast-change"], sourceIDs: ["nci-breast-symptoms"]),
        .init(id: "abnormal-mammogram", title: "Abnormal mammogram", group: "Breast & oncology", aliases: [], routeIDs: ["breast-change"], sourceIDs: ["nci-breast-symptoms"]),
        .init(id: "breast-calcifications", title: "Breast calcifications", group: "Breast & oncology", aliases: [], routeIDs: ["breast-change"], sourceIDs: ["nci-breast-symptoms"]),
        .init(id: "nipple-discharge", title: "Nipple discharge", group: "Breast & oncology", aliases: [], routeIDs: ["breast-change"], sourceIDs: ["nci-breast-symptoms"]),
        .init(id: "breast-biopsy", title: "Breast biopsy finding", group: "Breast & oncology", aliases: [], routeIDs: ["breast-change"], sourceIDs: ["nci-breast-symptoms"]),

        .init(id: "preeclampsia", title: "Preeclampsia", group: "Pregnancy & reproductive", aliases: [], routeIDs: ["pregnancy-hypertension"], sourceIDs: ["acog-preeclampsia"]),
        .init(id: "gestational-hypertension", title: "Gestational hypertension", group: "Pregnancy & reproductive", aliases: [], routeIDs: ["pregnancy-hypertension"], sourceIDs: ["acog-preeclampsia"]),
        .init(id: "postpartum-preeclampsia", title: "Postpartum preeclampsia", group: "Pregnancy & reproductive", aliases: [], routeIDs: ["pregnancy-hypertension"], sourceIDs: ["acog-preeclampsia"]),
        .init(id: "eclampsia", title: "Eclampsia", group: "Pregnancy & reproductive", aliases: [], routeIDs: ["pregnancy-hypertension-emergency"], sourceIDs: ["acog-preeclampsia"]),
        .init(id: "hellp", title: "HELLP syndrome", group: "Pregnancy & reproductive", aliases: [], routeIDs: ["pregnancy-hypertension-emergency"], sourceIDs: ["acog-preeclampsia"]),

        .init(id: "acl-injury", title: "ACL injury", group: "Orthopaedics & rehabilitation", aliases: ["anterior cruciate ligament injury"], routeIDs: ["acl-knee-injury"], sourceIDs: ["aaos-acl-injuries"]),
        .init(id: "acl-tear", title: "ACL tear", group: "Orthopaedics & rehabilitation", aliases: [], routeIDs: ["acl-knee-injury"], sourceIDs: ["aaos-acl-injuries"]),
        .init(id: "meniscal-tear", title: "Meniscal tear", group: "Orthopaedics & rehabilitation", aliases: [], routeIDs: ["acl-knee-injury"], sourceIDs: ["aaos-acl-injuries"]),
        .init(id: "knee-instability", title: "Knee instability", group: "Orthopaedics & rehabilitation", aliases: [], routeIDs: ["acl-knee-injury"], sourceIDs: ["aaos-acl-injuries"])
    ]

    static let preliminaryDiagnoses = corePreliminaryDiagnoses + NHSInformCatalog.diagnoses

    static let nhsInformReferenceRule = RoutingRule(
        id: "nhs-inform-reference",
        title: "NHS Inform A–Z entry without a specialty mapping",
        requiredSymptoms: [],
        diagnosisTerms: [],
        urgency: .reference,
        rationale: "The selected item is a condition title from NHS Inform’s A–Z index. This app has not assigned a specialty pathway to it, and the title alone cannot establish a diagnosis or urgency. Start with a clinician who can assess the actual symptoms, history, and tests; use emergency services for immediate danger.",
        careApproach: .notClassified,
        recommendations: [
            .init(id: "nhs-reference-primary", specialty: "Primary Care / General Practice", subspecialty: "Initial clinical assessment", role: "Assess the situation and coordinate any appropriate referral."),
            .init(id: "nhs-reference-directed", specialty: "Clinician-directed specialty referral", subspecialty: "Depends on assessment", role: "A specialty is selected only after clinical evaluation rather than inferred from an index label.")
        ],
        sourceIDs: ["nhs-inform-az", "abms-taxonomy"]
    )

    static let preliminaryDiagnosisByID = Dictionary(uniqueKeysWithValues: preliminaryDiagnoses.map { ($0.id, $0) })
}
