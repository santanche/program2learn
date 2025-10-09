% Facts from CSV - symptom-disease relationships with weights
has(diabetes_mellitus, blindness, 31.85).
has(diabetes_mellitus, obesity, 2709.96).
has(myocardial_infarction, obesity, 233.95).
has(uveitis, blindness, 49.42).

% Facts from type CSV - term types
type(blindness, symptom).
type(diabetes_mellitus, disease).
type(obesity, symptom).
type(myocardial_infarction, disease).
type(uveitis, disease).

% Rule to find diseases that share a symptom with average weight
symptom_similar(D1, D2, AvgWeight) :-
    type(D1, disease),
    type(D2, disease),
    has(D1, Symptom, W1),
    has(D2, Symptom, W2),
    type(Symptom, symptom),
    D1 @< D2,
    AvgWeight is (W1 + W2) / 2.

symptom_similar(D1, D2, AvgWeight).
