import Foundation

/// Titles reproduced from the NHS Inform A–Z condition index on 28 September 2026.
/// They are index labels, not diagnoses made by this app. Each title receives one
/// broad candidate-service route; the title alone does not determine urgency or
/// establish that a referral is needed.
enum NHSInformCatalog {
    static let diagnoses: [PreliminaryDiagnosis] = rawTitles
        .split(whereSeparator: \.isNewline)
        .enumerated()
        .map { index, title in
            .init(
                id: "nhs-inform-\(index + 1)",
                title: String(title),
                group: "NHS Inform A–Z",
                aliases: [],
                routeIDs: NHSInformSpecialtyMappings.routeIDs(for: String(title)),
                sourceIDs: ["nhs-inform-az", "abms-taxonomy"]
            )
        }

    static let rawTitles = """
Abdominal aortic aneurysm
About aplastic anaemia
Achilles tendinopathy
Acid and chemical burns
Acne
Acute cholecystitis
Acute lymphoblastic leukaemia
Acute myeloid leukaemia
Acute pancreatitis
Acute respiratory infection (ARI)
ADHD in adults
ADHD in children and young people
Addison’s disease
Adenomyosis
Alcohol-related liver disease
Allergic rhinitis
Allergies
Alopecia (hair loss)
Alzheimer’s disease
Anal cancer
Anaphylaxis
Angina
Angioedema
Animal and human bites
Ankle sprain
Ankle avulsion fracture
Ankle problems
Ankylosing spondylitis
Anorexia nervosa
Anxiety disorders in children and young people
Aplastic anaemia in children and young people
Appendicitis
Arthritis
Asbestosis
Asthma
Ataxia
Athlete’s foot
Atopic eczema
Atrial fibrillation
Autism
Back problems
Bacterial vaginosis
Becker muscular dystrophy
Benign prostate enlargement
Benign skin lesions
Bile duct cancer (cholangiocarcinoma)
Binge eating disorder (BED)
Bipolar disorder
Bladder cancer
Blisters
Body changes and cancer
Bone cancer
Bottom shuffling in young children
Bowel cancer
Bowel incontinence
Bowel polyps
Bow legs and knock knees in children and young people
Brain stem death
Brain tumours
Breast cancer in women
Breast cancer in men
Breast pain
Breast swelling in men
Breathing problems in children
Breathlessness
Breathlessness and cancer
Bronchiectasis
Bronchitis
Bulimia nervosa
Bunion (hallux valgus)
Burns and scalds
Calf problems
Cancer and your emotions
Cancer-related fatigue
Cardiac arrest
Cardiovascular disease
Carpal tunnel syndrome
Catarrh
Cellulitis
Cerebral palsy
Cervical cancer
Cervical spondylosis
Chest and rib injury
Chest infection
Chest pain
Chickenpox
Chilblains
Chlamydia
Chronic kidney disease
Chronic lymphocytic leukaemia
Chronic myeloid leukaemia
Chronic obstructive pulmonary disease (COPD)
Chronic pain
Chronic pancreatitis
Cirrhosis
Clavicle (collar bone) fracture
Clostridium difficile
Coeliac disease
Cold sore
Coma
Common cold
Complications of type 1 diabetes
Concussion
Congenital heart disease
Congenital muscular dystrophy (CMD)
Conjunctivitis
Constipation
Coronary heart disease
Coronavirus (COVID-19)
Coronavirus (COVID-19): Longer-term effects (long COVID)
Costochondritis
Cough
Crohn’s disease
Croup
Cuts and grazes
Cystic fibrosis
Cystitis
Deafblindness
Deep vein thrombosis
Degenerative cervical myelopathy
Dehydration
Delirium
Dementia
Dementia with Lewy bodies
Dental abscess
Depression
Dermatitis herpetiformis
Diabetic foot issues
Diabetic ketoacidosis (DKA)
Diabetic retinopathy
Diarrhoea in adults
Diarrhoea in children and babies
Discoid eczema
Diverticular disease and diverticulitis
Dizziness (lightheadedness)
Down’s syndrome
Dry mouth
Duchenne muscular dystrophy (DMD)
Dysphagia (swallowing problems)
Living with dysfibrinogenemia
Dystonia
Eating disorders
Earache
Early miscarriage
Earwax build-up
Eating and digestion with cancer
Ebola virus disease
Ectopic pregnancy
Elbow problems
Elbow (radial head or neck) fracture
Edwards’ syndrome
Emery-Dreifuss muscular dystrophy
Endometriosis
Epilepsy
Erectile dysfunction (impotence)
Shiga toxin-producing E. coli (STEC)
Ewing sarcoma
Excessive sweating (hyperhidrosis)
Eye cancer
Facial palsy
Facioscapulohumeral muscular dystrophy (FSHD)
Farting
Febrile seizures
Feeling of something in your throat (Globus)
Fever in adults
Fever in children
Fibroids
Fibromyalgia
Flat feet in children and young people
Flu
Food allergy
Food poisoning
Foot and toe problems
Fragility fracture of the hip
Frozen shoulder
Fungal infections
Fungal nail infection
Fungal scalp infection (tinea capitis)
Functional neurological disorder (FND)
Gallbladder cancer
Gallstones
Ganglion cyst
Ganglion cysts in children and young people
Gastroenteritis in adults
Gastroenteritis in children and babies
Gastro-oesophageal reflux disease (GORD)
Generalised anxiety disorder (GAD)
Genital herpes
Genital warts
Glandular fever
Golfers elbow
Gonorrhoea
Gout
Greater trochanteric pain syndrome
Gum disease
Piles (haemorrhoids)
Hair loss and cancer
Hand, foot and mouth disease
Hay fever
Head and neck cancer
Head lice and nits
Headaches
Hearing loss
Heart attack
Heart block
Heart disease
Heart failure
Heart palpitations
Heatstroke and heat illness
Hepatitis A
Hepatitis B
Hepatitis C
Hiatus hernia
High blood pressure (hypertension)
High cholesterol
Hip problems
Hip problems in children and young people
HIV
Hives
Hodgkin lymphoma
How to prevent allergy symptoms
Huntington’s disease
Hydrocephalus
Hyperglycaemia (high blood sugar)
Hypoglycaemia (low blood sugar)
Hypothermia (low body temperature)
Idiopathic pulmonary fibrosis
If your child has cold or flu symptoms
Impetigo
Indigestion
Ingrown toenail
Infertility
Inflammatory bowel disease (IBD)
Inherited heart conditions
Insomnia
Intoeing (pigeon toe) in children and young people
Iron deficiency anaemia
Irritable bowel syndrome (IBS)
Itchy bottom
Itchy skin
Jellyfish and sea creature stings
Joint hypermobility
Kaposi’s sarcoma
Kidney cancer
Chronic kidney disease
Kidney infection
Kidney stones
Knee problems
Labyrinthitis
Lactose intolerance
Laryngeal (larynx) cancer
Laryngitis
Late miscarriage
Lead poisoning
Learning disability
Leg cramps
Legionnaires’ disease
Lichen planus
Limb girdle muscular dystrophy
Lipoedema
Liver cancer
Liver disease
Living with chronic pain
Living well with COPD
Long-term effects of COVID-19
Low sex drive (loss of libido)
Low blood pressure (hypotension)
Lung cancer
Lupus
Lyme disease
Lymphoedema
Lymphogranuloma venereum (LGV)
Malaria
Malnutrition
Managing genital symptoms
Measles
Mechanical neck pain
Melanoma
Meningitis
Meniere’s disease
Menopause
Mesothelioma
Metacarpal fracture of the hand
Middle ear infection (otitis media)
Migraine
Minor head injury
Miscarriage
Molar pregnancy
Motor neurone disease (MND)
Mouth cancer
Mouth ulcer
Myeloma
Multiple sclerosis (MS)
Multiple system atrophy (MSA)
Mumps
Munchausen syndrome
Muscular dystrophy
Myalgic encephalomyelitis (ME) or chronic fatigue syndrome (CFS)
Myasthenia gravis
Mycoplasma genitalium (Mgen)
Myotonic dystrophy
Nasal and sinus cancer
Nasopharyngeal cancer
Neck injury
Neck problems
Neuroendocrine tumours
Nipple discharge
Nipple inversion (inside out nipple)
Non-alcoholic fatty liver disease (NAFLD)
Non-Hodgkin lymphoma
Norovirus
Nosebleed
Obesity
Obsessive compulsive disorder (OCD)
Obstructive sleep apnoea
Oculopharyngeal muscular dystrophy (OPMD)
Oesophageal cancer
Oral thrush in adults
Osteoarthritis
Osteoarthritis of the hip
Osteoarthritis of the knee
Osteoarthritis of the hand
Osteoporosis
Outer ear infection (otitis externa)
Ovarian cancer
Ovarian cyst
Overactive thyroid
Pain in the ball of the foot
Paget’s disease of the breast
Pain and cancer
Pancreatic cancer
Panic disorder
Parkinson’s disease
Patau’s syndrome
Patellofemoral pain syndrome
Pelvic girdle pain
Pelvic inflammatory disease
Pelvic organ prolapse
Penile cancer
Peripheral neuropathy
Personality disorder
Perthes’ disease
Phobias
PIMS
Plantar heel pain
Pleurisy
Pneumonia
Polio
Polyendocrine metabolic ovarian syndrome (PMOS)
Polymyalgia rheumatica
Post-concussion syndrome
Post-polio syndrome
Popliteal cysts in children and young people
Positional talipes in children and young people
Post-traumatic stress disorder (PTSD)
Postural orthostatic tachycardia syndrome (PoTS)
Postnatal depression
Pressure ulcers
Progressive supranuclear palsy (PSP)
Prostate cancer
Psoriasis
Psoriatic arthritis
Psychosis
Psychotic depression
Pubic lice
Rare cancers
Rare conditions
Raynaud’s phenomenon
Reactive arthritis
Recovering from a cardiac arrest
Recurrent miscarriage
Restless legs syndrome
Respiratory syncytial virus (RSV)
Rheumatoid arthritis
Ringworm
Rosacea
Scabies
Scarlet fever
Schizophrenia
Sciatica
About scoliosis
Seasonal affective disorder (SAD)
Sepsis
Septic shock
Severe head injury
Shiga toxin-producing E. coli (STEC)
Shigella
Shingles
Shortness of breath
Shoulder problems
Sickle cell disease
Living with sickle cell anaemia
Sinusitis
Sjogren’s disease
Skin cancer
Skin light sensitivity (photosensitivity)
Skin rashes in children
Slapped cheek syndrome
Slipped upper femoral epiphysis (SUFE) in children and young people
Snapping hip in children and young people
Social anxiety disorder
Soft tissue injury advice
Soft tissue sarcomas
Sore throat
Spina bifida
Spinal stenosis
Spleen problems and spleen removal
Stillbirth
Stomach ache and abdominal pain
Stomach cancer
Stomach ulcer
Streptococcus A (strep A)
Stroke
Subacromial pain syndrome
Sudden arrhythmic death syndrome (SADS)
Suicide
Sunbed and tanning safety
Sunburn
Supraventricular tachycardia
Swollen glands
Syphilis
Self-harm
Talking to children and teenagers about cancer
Tennis elbow
Testicular cancer
Testicular lumps and swellings
Thigh problems
Thirst
Threadworms
Thrush
Thumb fracture
Thyroid cancer
Tick bites
Tinnitus
Toe problems in children and young people
Toe walking in children and young people
Tonsillitis
Tooth decay
Toothache
Tourette’s syndrome
Traction apophysitis of the hip in children and young people
Transient ischaemic attack (TIA)
Transverse myelitis
Treatment for bites and stings
Trichomonas infection
Trigeminal neuralgia
Trigger thumb or trigger finger in children and young people
Trips and falls in young children
Tuberculosis (TB)
Type 1 diabetes
Type 2 diabetes
Types of bites and stings
Ulcerative colitis
Underactive thyroid
Urinary incontinence
Urinary incontinence in women
Urinary tract infection (UTI)
Urinary tract infection (UTI) in children
Vaginal cancer
Vaginal discharge
Varicose eczema
Varicose veins
Vascular dementia
Living with vasculitis
Venous leg ulcer
Vertigo
Vitamin B12 or folate deficiency anaemia
Vomiting in adults
Vomiting in children and babies
Vulval cancer
Warts and verrucas
Whiplash
Whooping cough
Wolff-Parkinson-White syndrome
Womb (uterus) cancer
Wrist fracture
Wrist, hand, finger and thumb problems
Yellow fever
Zika virus
"""
}

private struct NHSInformSpecialtyCategory {
    let id: String
    let title: String
    let rationale: String
    let careApproach: CareApproach
    let recommendations: [SpecialtyRecommendation]
}

/// Broad, human-authored condition-title map for the NHS Inform A–Z import.
/// It is intentionally a service-discovery map rather than a diagnostic, triage,
/// or referral engine: one index title cannot establish urgency or the correct
/// subspecialty for an individual person.
enum NHSInformSpecialtyMappings {
    static func routeIDs(for title: String) -> [String] {
        [routeID(for: title)]
    }

    static let rules: [RoutingRule] = categories.map { category in
        let terms = NHSInformCatalog.diagnoses
            .filter { routeIDs(for: $0.title).contains(category.id) }
            .map(\.title)
        return RoutingRule(
            id: category.id,
            title: category.title,
            requiredSymptoms: [],
            diagnosisTerms: terms,
            urgency: .unspecified,
            rationale: category.rationale,
            careApproach: category.careApproach,
            recommendations: category.recommendations,
            sourceIDs: ["nhs-inform-az", "abms-taxonomy"]
        )
    }

    private static func routeID(for title: String) -> String {
        let term = normalize(title)

        if containsAny(term, [
            "anaphylaxis", "angioedema", "acid and chemical burns", "burns and scalds", "cardiac arrest", "coma", "diabetic ketoacidosis", "ectopic pregnancy", "heatstroke", "hypothermia", "lead poisoning", "meningitis", "sepsis", "septic shock", "severe head injury", "appendicitis", "acute cholecystitis", "acute pancreatitis", "animal and human bites", "jellyfish and sea creature stings"
        ]) {
            return "nhs-emergency-acute-care"
        }

        if containsAny(term, [
            "cancer", "sarcoma", "leukaemia", "leukemia", "lymphoma", "myeloma", "mesothelioma", "kaposi", "neuroendocrine tumour", "brain tumour", "rare cancer", "body changes and cancer", "cancer related", "cancer and your emotions", "cancer and your"
        ]) {
            return "nhs-cancer-care"
        }

        if containsAny(term, [
            "children", "child", "young people", "young child", "baby", "babies", "pims", "autism", "down s syndrome", "edwards syndrome", "patau s syndrome", "learning disability", "bottom shuffling", "bow legs", "knock knees", "intoeing", "positional talipes", "toe walking", "trips and falls"
        ]) {
            return "nhs-paediatrics-development"
        }

        if containsAny(term, [
            "adhd", "anorexia", "anxiety", "binge eating", "bipolar", "bulimia", "depression", "eating disorder", "generalised anxiety", "munchausen", "obsessive compulsive", "panic disorder", "personality disorder", "phobia", "post traumatic stress", "postnatal depression", "psychosis", "schizophrenia", "seasonal affective", "self harm", "suicide", "social anxiety"
        ]) {
            return "nhs-mental-behavioral-health"
        }

        if containsAny(term, [
            "aplastic anaemia", "anaemia", "dysfibrinogenemia", "sickle cell", "blood clot", "deep vein thrombosis", "vitamin b12", "folate deficiency"
        ]) {
            return "nhs-hematology"
        }

        if containsAny(term, [
            "aortic aneurysm", "angina", "atrial fibrillation", "cardiac", "cardiovascular", "coronary", "heart attack", "heart block", "heart disease", "heart failure", "heart palpitations", "high blood pressure", "high cholesterol", "inherited heart", "postural orthostatic", "pots", "sudden arrhythmic", "supraventricular tachycardia", "varicose veins", "venous leg ulcer", "lymphoedema", "lipoedema", "raynaud"
        ]) {
            return "nhs-cardiovascular-vascular"
        }

        if containsAny(term, [
            "asbestosis", "asthma", "breathing", "breathlessness", "bronchiectasis", "bronchitis", "chest infection", "chronic obstructive", "copd", "cough", "croup", "cystic fibrosis", "idiopathic pulmonary", "pneumonia", "pleurisy", "respiratory syncytial", "sleep apnoea", "shortness of breath", "whooping cough"
        ]) {
            return "nhs-respiratory-sleep"
        }

        if containsAny(term, [
            "addison", "diabetes", "hyperglycaemia", "hypoglycaemia", "obesity", "overactive thyroid", "underactive thyroid", "thyroid", "thirst", "polyendocrine", "osteoporosis"
        ]) {
            return "nhs-endocrinology-metabolism"
        }

        if containsAny(term, [
            "benign prostate", "bladder", "cystitis", "erectile dysfunction", "kidney", "urinary", "testicular", "penile", "incontinence"
        ]) {
            return "nhs-kidney-urinary"
        }

        if containsAny(term, [
            "adenomyosis", "bacterial vaginosis", "breast pain", "breast swelling", "cervical", "chlamydia", "endometriosis", "fibroids", "genital", "gonorrhoea", "infertility", "menopause", "miscarriage", "molar pregnancy", "ovarian", "pelvic inflammatory", "pelvic organ", "pregnancy", "recurrent miscarriage", "stillbirth", "trichomonas", "vaginal", "vulval", "womb"
        ]) {
            return "nhs-reproductive-womens-health"
        }

        if containsAny(term, [
            "acne", "alopecia", "athlete s foot", "atopic eczema", "benign skin", "blisters", "chilblains", "cold sore", "dermatitis", "discoid eczema", "excessive sweating", "fungal", "hair loss", "hives", "impetigo", "itchy", "lichen planus", "psoriasis", "ringworm", "rosacea", "scabies", "skin", "sunbed", "sunburn", "warts", "verrucas", "varicose eczema", "pressure ulcers"
        ]) {
            return "nhs-dermatology"
        }

        if containsAny(term, [
            "allergic rhinitis", "allergies", "food allergy", "hay fever", "prevent allergy"
        ]) {
            return "nhs-allergy-immunology"
        }

        if containsAny(term, [
            "ear", "hearing", "labyrinthitis", "laryng", "meniere", "nosebleed", "nose", "nasal", "nasopharyngeal", "sinus", "sore throat", "tinnitus", "tonsillitis", "vertigo", "globus", "catarrh"
        ]) {
            return "nhs-ear-nose-throat"
        }

        if containsAny(term, [
            "conjunctivitis", "deafblindness", "diabetic retinopathy", "eye"
        ]) {
            return "nhs-ophthalmology"
        }

        if containsAny(term, [
            "achilles", "ankle", "arthritis", "back problems", "bunion", "calf", "carpal tunnel", "cervical spondylosis", "chest and rib injury", "clavicle", "costochondritis", "elbow", "foot", "fracture", "frozen shoulder", "ganglion", "golfers elbow", "hip", "joint hypermobility", "knee", "mechanical neck", "neck injury", "neck problems", "osteoarthritis", "patellofemoral", "pelvic girdle", "perthes", "plantar", "shoulder", "sciatica", "scoliosis", "slipped upper femoral", "snapping hip", "soft tissue", "spinal stenosis", "subacromial", "tennis elbow", "thigh", "thumb", "toe problems", "trigger thumb", "trigger finger", "whiplash", "wrist"
        ]) {
            return "nhs-musculoskeletal-rehabilitation"
        }

        if containsAny(term, [
            "alzheimer", "ataxia", "becker muscular", "cerebral palsy", "concussion", "delirium", "dementia", "dystonia", "facial palsy", "functional neurological", "huntington", "hydrocephalus", "limb girdle", "motor neurone", "multiple sclerosis", "multiple system atrophy", "muscular dystrophy", "myasthenia", "myotonic", "neuropathy", "parkinson", "post concussion", "post polio", "progressive supranuclear", "restless legs", "spina bifida", "stroke", "tourette", "transient ischaemic", "transverse myelitis", "trigeminal", "epilepsy", "seizure", "headache", "migraine"
        ]) {
            return "nhs-neurology"
        }

        if containsAny(term, [
            "acute respiratory infection", "chickenpox", "clostridium", "common cold", "coronavirus", "covid", "ebola", "fever", "flu", "food poisoning", "gastroenteritis", "glandular fever", "hand foot and mouth", "hepatitis", "hiv", "legionnaires", "lyme", "malaria", "measles", "mumps", "norovirus", "polio", "scarlet fever", "shiga", "shigella", "shingles", "strep", "syphilis", "tuberculosis", "yellow fever", "zika", "tick bites"
        ]) {
            return "nhs-infectious-disease"
        }

        if containsAny(term, [
            "acute cholecystitis", "alcohol related liver", "bile duct", "bowel", "chronic pancreatitis", "cirrhosis", "coeliac", "constipation", "crohn", "diarrhoea", "diverticular", "dysphagia", "eating and digestion", "farting", "gallstones", "gastro oesophageal", "gord", "hiatus hernia", "indigestion", "inflammatory bowel", "irritable bowel", "lactose intolerance", "liver disease", "non alcoholic fatty", "piles", "spleen", "stomach", "ulcerative colitis", "vomiting"
        ]) {
            return "nhs-gastroenterology-hepatology"
        }

        if containsAny(term, [
            "dental", "gum disease", "mouth ulcer", "tooth"
        ]) {
            return "nhs-dental-oral-health"
        }

        if containsAny(term, [
            "chronic pain", "fibromyalgia", "myalgic encephalomyelitis", "chronic fatigue", "living with chronic pain", "post polio"
        ]) {
            return "nhs-pain-rehabilitation"
        }

        return "nhs-primary-care-generalist"
    }

    private static func containsAny(_ term: String, _ phrases: [String]) -> Bool {
        phrases.contains { term.contains($0) }
    }

    private static func normalize(_ text: String) -> String {
        text
            .lowercased()
            .folding(options: .diacriticInsensitive, locale: .current)
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }

    private static let categories: [NHSInformSpecialtyCategory] = [
        .init(
            id: "nhs-emergency-acute-care",
            title: "NHS Inform candidate service: acute and emergency care",
            rationale: "This NHS Inform index label can describe an acute situation. The title alone cannot set the correct urgency or destination; current symptoms must be assessed immediately by an appropriate clinician or emergency service.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "nhs-emergency", specialty: "Emergency Medicine", subspecialty: "Acute evaluation and stabilization", role: "Immediate assessment and coordination when current symptoms may be severe or rapidly worsening."),
                .init(id: "nhs-emergency-directed", specialty: "Clinician-directed acute specialty service", subspecialty: "Depends on examination and testing", role: "The acute-care team selects the relevant inpatient or procedure-capable service.")
            ]
        ),
        .init(
            id: "nhs-cancer-care",
            title: "NHS Inform candidate service: cancer and hematologic cancer care",
            rationale: "A cancer-related index label may require a multidisciplinary team. The actual service and treatment path depend on the organ, pathology, stage, symptoms, and testing.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "nhs-oncology", specialty: "Internal Medicine", subspecialty: "Medical Oncology / Hematology", role: "Diagnostic review and systemic-treatment planning when appropriate."),
                .init(id: "nhs-surgical-oncology", specialty: "Surgery", subspecialty: "Surgical Oncology / Site-specific Surgery", role: "Surgical assessment when the diagnosis and findings support it."),
                .init(id: "nhs-radiation-oncology", specialty: "Radiation Oncology", subspecialty: "Radiation Oncology", role: "Radiation-treatment assessment when appropriate.")
            ]
        ),
        .init(
            id: "nhs-paediatrics-development",
            title: "NHS Inform candidate service: paediatrics and child development",
            rationale: "A child- or young-person-specific label needs age-appropriate assessment. The eventual specialty depends on the child’s development, symptoms, examination, and test results.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-paediatrics", specialty: "Pediatrics", subspecialty: "General Pediatrics / Developmental-Behavioral Pediatrics", role: "Age-appropriate assessment and referral coordination."),
                .init(id: "nhs-paediatric-directed", specialty: "Clinician-directed pediatric specialty referral", subspecialty: "Depends on findings", role: "A focused pediatric service is chosen after assessment.")
            ]
        ),
        .init(
            id: "nhs-mental-behavioral-health",
            title: "NHS Inform candidate service: mental and behavioral health",
            rationale: "This index label points to mental-health assessment and support. Immediate safety concerns need crisis or emergency help rather than waiting for a routine specialty service.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-psychiatry", specialty: "Psychiatry", subspecialty: "General / Consultation-Liaison Psychiatry", role: "Diagnostic assessment and treatment planning when referred."),
                .init(id: "nhs-behavioral-health", specialty: "Behavioral Health", subspecialty: "Psychotherapy / Community Mental Health", role: "Therapy and continuing support as clinically appropriate.")
            ]
        ),
        .init(
            id: "nhs-hematology",
            title: "NHS Inform candidate service: hematology",
            rationale: "A blood, anemia, or clotting-related title may need laboratory review and a cause-specific work-up. The correct service and urgency depend on the current clinical picture.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-hematology", specialty: "Internal Medicine", subspecialty: "Hematology", role: "Blood-disorder, anemia, and clotting evaluation when referred."),
                .init(id: "nhs-heme-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial assessment and coordination when appropriate.")
            ]
        ),
        .init(
            id: "nhs-cardiovascular-vascular",
            title: "NHS Inform candidate service: cardiovascular and vascular care",
            rationale: "A heart or blood-vessel index label may need cardiovascular assessment. Urgency and any procedural involvement depend on symptoms, examination, electrocardiography, imaging, and testing.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "nhs-cardiology", specialty: "Cardiology", subspecialty: "Cardiovascular Disease", role: "Cardiac assessment and treatment planning when referred."),
                .init(id: "nhs-vascular", specialty: "Surgery", subspecialty: "Vascular Surgery", role: "Vascular assessment when the condition and testing indicate it.")
            ]
        ),
        .init(
            id: "nhs-respiratory-sleep",
            title: "NHS Inform candidate service: respiratory and sleep medicine",
            rationale: "A breathing or sleep-related title needs clinician-led assessment. The appropriate service varies with severity, infection status, testing, and other health conditions.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-pulmonary", specialty: "Internal Medicine", subspecialty: "Pulmonary Disease", role: "Respiratory-disease assessment when referred."),
                .init(id: "nhs-sleep", specialty: "Sleep Medicine", subspecialty: "Sleep-Related Breathing Disorders", role: "Sleep-study and treatment planning when appropriate.")
            ]
        ),
        .init(
            id: "nhs-endocrinology-metabolism",
            title: "NHS Inform candidate service: endocrinology and metabolism",
            rationale: "A hormone, glucose, thyroid, or metabolic index label may need laboratory and clinical evaluation. The title alone does not establish the cause or treatment direction.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-endocrinology", specialty: "Internal Medicine", subspecialty: "Endocrinology, Diabetes, and Metabolism", role: "Hormone and metabolic assessment when referred."),
                .init(id: "nhs-endocrine-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial testing and coordination when appropriate.")
            ]
        ),
        .init(
            id: "nhs-kidney-urinary",
            title: "NHS Inform candidate service: kidney and urinary care",
            rationale: "A kidney, urinary, or genital-urinary index label needs cause-specific evaluation. A clinician determines whether kidney medicine, urology, or urgent care is appropriate.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "nhs-nephrology", specialty: "Internal Medicine", subspecialty: "Nephrology", role: "Kidney-function and chronic kidney-disease assessment when referred."),
                .init(id: "nhs-urology", specialty: "Urology", subspecialty: "General Urology", role: "Urinary-tract and male reproductive-system assessment when appropriate.")
            ]
        ),
        .init(
            id: "nhs-reproductive-womens-health",
            title: "NHS Inform candidate service: reproductive and women’s health",
            rationale: "A reproductive-health index label needs individualized assessment, including pregnancy status when relevant. The correct setting and any specialist involvement depend on symptoms and findings.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "nhs-obgyn", specialty: "Obstetrics and Gynecology", subspecialty: "General Obstetrics and Gynecology", role: "Reproductive-health assessment and referral coordination."),
                .init(id: "nhs-rei", specialty: "Obstetrics and Gynecology", subspecialty: "Reproductive Endocrinology and Infertility", role: "Focused fertility evaluation when appropriate.")
            ]
        ),
        .init(
            id: "nhs-dermatology",
            title: "NHS Inform candidate service: dermatology",
            rationale: "A skin, hair, nail, or rash-related index label may need dermatologic assessment. Examination and, when needed, testing determine the cause and treatment.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-dermatology", specialty: "Dermatology", subspecialty: "Medical Dermatology", role: "Skin, hair, and nail assessment when referred."),
                .init(id: "nhs-derm-surgery", specialty: "Dermatology", subspecialty: "Dermatologic Surgery", role: "Procedure-focused care only when diagnosis and findings warrant it.")
            ]
        ),
        .init(
            id: "nhs-allergy-immunology",
            title: "NHS Inform candidate service: allergy and immunology",
            rationale: "An allergy-related index label may need trigger review and clinician-led testing. Severe current allergic symptoms require urgent assessment rather than routine referral selection.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-allergy", specialty: "Allergy and Immunology", subspecialty: "Allergic Disease", role: "Allergy evaluation and treatment planning when referred."),
                .init(id: "nhs-allergy-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial assessment and coordination when appropriate.")
            ]
        ),
        .init(
            id: "nhs-ear-nose-throat",
            title: "NHS Inform candidate service: ear, nose, and throat care",
            rationale: "An ear, nose, throat, balance, or hearing-related index label may need examination and testing. The correct urgency and subspecialty depend on current symptoms and findings.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-ent", specialty: "Otolaryngology–Head and Neck Surgery", subspecialty: "General Otolaryngology", role: "Ear, nose, throat, and upper-airway assessment when referred."),
                .init(id: "nhs-audiology", specialty: "Audiology", subspecialty: "Diagnostic Audiology", role: "Hearing testing when clinically indicated.")
            ]
        ),
        .init(
            id: "nhs-ophthalmology",
            title: "NHS Inform candidate service: eye care",
            rationale: "An eye-related index label may need ophthalmic assessment. New or severe visual symptoms can require urgent care and cannot be triaged from the label alone.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "nhs-ophthalmology", specialty: "Ophthalmology", subspecialty: "Comprehensive Ophthalmology", role: "Eye examination and treatment planning when referred."),
                .init(id: "nhs-retina", specialty: "Ophthalmology", subspecialty: "Vitreoretinal / Retina", role: "Retinal assessment when examination findings support it.")
            ]
        ),
        .init(
            id: "nhs-musculoskeletal-rehabilitation",
            title: "NHS Inform candidate service: musculoskeletal and rehabilitation care",
            rationale: "A bone, joint, muscle, tendon, or injury-related index label needs examination and, when appropriate, imaging. Whether a procedure is relevant depends on the specific injury or condition.",
            careApproach: .mixedCare,
            recommendations: [
                .init(id: "nhs-orthopaedics", specialty: "Orthopaedic Surgery", subspecialty: "General Orthopaedics / Sports Medicine", role: "Musculoskeletal diagnosis and treatment planning when referred."),
                .init(id: "nhs-pmr", specialty: "Physical Medicine and Rehabilitation", subspecialty: "Musculoskeletal Rehabilitation", role: "Nonoperative rehabilitation and function-focused care when appropriate.")
            ]
        ),
        .init(
            id: "nhs-neurology",
            title: "NHS Inform candidate service: neurology and nervous-system care",
            rationale: "A nervous-system index label may need neurologic assessment. The correct setting, tests, and any procedural involvement depend on current symptoms, examination, and imaging.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-neurology", specialty: "Neurology", subspecialty: "General Neurology", role: "Nervous-system assessment and treatment planning when referred."),
                .init(id: "nhs-neurosurgery", specialty: "Neurological Surgery", subspecialty: "Neurosurgical Assessment", role: "Surgical review only when findings indicate a structural or operative concern.")
            ]
        ),
        .init(
            id: "nhs-infectious-disease",
            title: "NHS Inform candidate service: infectious disease and travel medicine",
            rationale: "An infection-related index label needs clinical assessment; many are managed in primary care while severe, unusual, travel-related, or complicated infections may need specialist input.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-infectious-disease", specialty: "Internal Medicine", subspecialty: "Infectious Disease", role: "Complex, severe, or unusual infection assessment when referred."),
                .init(id: "nhs-infection-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial assessment and treatment coordination when appropriate.")
            ]
        ),
        .init(
            id: "nhs-gastroenterology-hepatology",
            title: "NHS Inform candidate service: digestive and liver care",
            rationale: "A digestive, bowel, gallbladder, pancreas, or liver index label may need clinician-led evaluation. The cause, severity, testing, and any endoscopic or surgical need determine the service.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "nhs-gastroenterology", specialty: "Gastroenterology", subspecialty: "General Gastroenterology / Hepatology", role: "Digestive and liver-disease evaluation when referred."),
                .init(id: "nhs-general-surgery", specialty: "Surgery", subspecialty: "General Surgery", role: "Surgical assessment only when the condition and findings indicate it.")
            ]
        ),
        .init(
            id: "nhs-dental-oral-health",
            title: "NHS Inform candidate service: dental and oral health",
            rationale: "A tooth, gum, or mouth-related index label usually needs dental examination. Urgent dental or emergency assessment may be needed for severe swelling, breathing difficulty, or systemic illness.",
            careApproach: .procedureOrSurgeryMayBeNeeded,
            recommendations: [
                .init(id: "nhs-dentistry", specialty: "Dentistry / Oral Health", subspecialty: "General Dentistry", role: "Dental examination and treatment planning."),
                .init(id: "nhs-oral-surgery", specialty: "Dentistry / Oral Health", subspecialty: "Oral and Maxillofacial Surgery", role: "Procedure-focused assessment when indicated.")
            ]
        ),
        .init(
            id: "nhs-pain-rehabilitation",
            title: "NHS Inform candidate service: pain and rehabilitation care",
            rationale: "A chronic pain, fatigue, or function-related index label needs a whole-person assessment. Treatment commonly combines medical, rehabilitative, and behavioral approaches.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-pain-medicine", specialty: "Physical Medicine and Rehabilitation", subspecialty: "Pain Medicine / Rehabilitation", role: "Function-focused assessment and multimodal treatment planning when referred."),
                .init(id: "nhs-pain-primary", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "Initial assessment and care coordination when appropriate.")
            ]
        ),
        .init(
            id: "nhs-primary-care-generalist",
            title: "NHS Inform candidate service: general clinical assessment",
            rationale: "This index label does not safely identify one organ-system specialty from its wording alone. A general clinician should assess the actual symptoms, history, examination, and tests before choosing a focused service.",
            careApproach: .moreLikelyNonsurgical,
            recommendations: [
                .init(id: "nhs-primary-care", specialty: "Primary Care / General Practice", subspecialty: "Initial Clinical Assessment", role: "Whole-person assessment and referral coordination."),
                .init(id: "nhs-general-internal", specialty: "Primary Care / Internal Medicine", subspecialty: "General Internal Medicine", role: "General medical evaluation when appropriate.")
            ]
        )
    ]
}
