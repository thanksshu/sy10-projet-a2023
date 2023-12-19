var_nb_chauffeur_2h = fisvar([0 50], "Name", "nb_chauffeur_2h");
var_nb_chauffeur_2h = addMF(var_nb_chauffeur_2h, "trapmf", [0 0 entree.nb_chauffeur*0.3 entree.nb_chauffeur*0.4], "Name", "tres_petit");
var_nb_chauffeur_2h = addMF(var_nb_chauffeur_2h, "trapmf", [entree.nb_chauffeur*0.3 entree.nb_chauffeur*0.4 entree.nb_chauffeur*0.6 entree.nb_chauffeur*0.7], "Name", "petit");
var_nb_chauffeur_2h = addMF(var_nb_chauffeur_2h, "trapmf", [entree.nb_chauffeur*0.6 entree.nb_chauffeur*0.7 entree.nb_chauffeur*0.8 entree.nb_chauffeur*0.9], "Name", "moyen");
var_nb_chauffeur_2h = addMF(var_nb_chauffeur_2h, "trapmf", [entree.nb_chauffeur*0.8 entree.nb_chauffeur*0.9 entree.nb_chauffeur entree.nb_chauffeur], "Name", "eleve");