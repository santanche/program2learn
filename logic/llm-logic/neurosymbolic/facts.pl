% A list of observable symptoms.
symptom(fever).
symptom(cough).
symptom(headache).
symptom(rash).
symptom(fatigue).
symptom(sore_throat).
symptom(nausea).
symptom(vomiting).
symptom(chest_pain).
symptom(shortness_of_breath).
symptom(sneezing).
symptom(runny_nose).
symptom(muscle_aches).

% A list of known diseases and their general severity.
disease(flu, mild).
disease(common_cold, mild).
disease(pneumonia, severe).
disease(covid_19, severe).
disease(measles, moderate).
disease(strep_throat, moderate).
disease(heart_attack, critical).
disease(anxiety, mild).

% Defines the symptoms associated with each disease.

% manifestation(Disease, Symptom).
manifestation(flu, fever).
manifestation(flu, cough).
manifestation(flu, headache).
manifestation(flu, fatigue).
manifestation(flu, muscle_aches).

manifestation(common_cold, cough).
manifestation(common_cold, sneezing).
manifestation(common_cold, runny_nose).
manifestation(common_cold, sore_throat).

manifestation(pneumonia, fever).
manifestation(pneumonia, cough).
manifestation(pneumonia, shortness_of_breath).
manifestation(pneumonia, chest_pain).
manifestation(pneumonia, fatigue).

manifestation(covid_19, fever).
manifestation(covid_19, cough).
manifestation(covid_19, fatigue).
manifestation(covid_19, shortness_of_breath).
manifestation(covid_19, loss_of_taste). % Note: 'loss_of_taste' is not in symptoms.pl

manifestation(measles, fever).
manifestation(measles, cough).
manifestation(measles, runny_nose).
manifestation(measles, rash).

manifestation(strep_throat, fever).
manifestation(strep_throat, sore_throat).
manifestation(strep_throat, headache).

manifestation(heart_attack, chest_pain).
manifestation(heart_attack, shortness_of_breath).
manifestation(heart_attack, nausea).

manifestation(anxiety, shortness_of_breath).
manifestation(anxiety, nausea).
