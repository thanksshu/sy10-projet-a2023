var_nb_chauffeur_2h = fisvar([0 500], "Name", "nb_chauffeur_2h");
var_nb_chauffeur_2h = addMF(var_nb_chauffeur_2h, "trapmf", entree.nb_chauffeur * [0 0 0.3 0.4], "Name", "tres_petit");
var_nb_chauffeur_2h = addMF(var_nb_chauffeur_2h, "trapmf", entree.nb_chauffeur * [0.3 0.4 0.6 0.7], "Name", "petit");
var_nb_chauffeur_2h = addMF(var_nb_chauffeur_2h, "trapmf", entree.nb_chauffeur * [0.6 0.7 0.8 0.9], "Name", "moyen");
var_nb_chauffeur_2h = addMF(var_nb_chauffeur_2h, "trapmf", entree.nb_chauffeur * [0.8 0.9 1 1], "Name", "eleve");