has_disease(Disease) :-
    disease(Disease, _),
    findall(Desc,
        entity(_, 'problem', Desc, _, _, _),
        PatientSymptoms),
    member(Symptom, PatientSymptoms),
    manifestation(Disease, Symptom).
