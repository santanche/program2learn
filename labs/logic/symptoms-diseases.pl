% ---------- Disease types ----------
type(hypertension, disease).
type(migraine, disease).
type(stroke, disease).
type(anemia, disease).
type(heart_failure, disease).
type(chronic_kidney_disease, disease).
type(pneumonia, disease).
type(copd, disease).
type(asthma, disease).
type(diabetes_mellitus, disease).

% ---------- Symptom types ----------
type(headache, symptom).
type(dizziness, symptom).
type(blurred_vision, symptom).
type(tiredness, symptom).
type(nausea, symptom).
type(photophobia, symptom).
type(weakness_one_side, symptom).
type(slurred_speech, symptom).
type(fatigue, symptom).
type(shortness_of_breath, symptom).
type(pallor, symptom).
type(edema, symptom).
type(cough, symptom).
type(chest_pain, symptom).
type(wheezing, symptom).
type(chest_tightness, symptom).

% ---------- Disease–Symptom associations ----------
has(hypertension, headache, 0.45).
has(hypertension, dizziness, 0.30).
has(hypertension, blurred_vision, 0.25).
has(hypertension, tiredness, 0.20).

has(migraine, headache, 0.80).
has(migraine, nausea, 0.50).
has(migraine, photophobia, 0.60).
has(migraine, dizziness, 0.35).

has(stroke, headache, 0.60).
has(stroke, dizziness, 0.55).
has(stroke, weakness_one_side, 0.70).
has(stroke, slurred_speech, 0.65).

has(anemia, fatigue, 0.70).
has(anemia, dizziness, 0.40).
has(anemia, shortness_of_breath, 0.50).
has(anemia, pallor, 0.45).

has(heart_failure, shortness_of_breath, 0.65).
has(heart_failure, edema, 0.55).
has(heart_failure, fatigue, 0.45).
has(heart_failure, cough, 0.30).

has(chronic_kidney_disease, edema, 0.50).
has(chronic_kidney_disease, fatigue, 0.35).
has(chronic_kidney_disease, shortness_of_breath, 0.40).
has(chronic_kidney_disease, nausea, 0.25).

has(pneumonia, cough, 0.70).
has(pneumonia, shortness_of_breath, 0.60).
has(pneumonia, chest_pain, 0.50).
has(pneumonia, fatigue, 0.30).

has(copd, cough, 0.65).
has(copd, shortness_of_breath, 0.60).
has(copd, wheezing, 0.55).
has(copd, fatigue, 0.25).

has(asthma, shortness_of_breath, 0.55).
has(asthma, cough, 0.50).
has(asthma, wheezing, 0.60).
has(asthma, chest_tightness, 0.45).

has(diabetes_mellitus, fatigue, 0.40).
has(diabetes_mellitus, blurred_vision, 0.35).
has(diabetes_mellitus, nausea, 0.30).
has(diabetes_mellitus, dizziness, 0.20).
