var_etat_du_ciel = fisvar([0 10], "Name", "etat_du_ciel");
var_etat_du_ciel = addMF(var_etat_du_ciel, "trapmf", [0 0 1 2], "Name", "dégagé");
var_etat_du_ciel = addMF(var_etat_du_ciel, "trapmf", [1 2 5 6], "Name", "épars");
var_etat_du_ciel = addMF(var_etat_du_ciel, "trapmf", [5 6 9 10], "Name", "fragmenté");
var_etat_du_ciel = addMF(var_etat_du_ciel, "trapmf", [9 10 10 10], "Name", "couvert");
