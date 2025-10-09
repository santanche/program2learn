bacteria(v_cholerae).
bacteria(e_coli).
bacteria(b_anthracis).
bacteria(c_difficile).

gram_positive(b_anthracis).
gram_positive(c_difficile).

gram_negative(B) :- bacteria(B), \+ gram_positive(B).

gram_negative(b_anthracis).