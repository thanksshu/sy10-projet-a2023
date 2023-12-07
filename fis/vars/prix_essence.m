var_prix_essence = fisvar([0 5], "Name", "prix_essence");
var_prix_essence = addMF(var_prix_essence, "trapmf", [0 0 1.4 1.8], "Name", "peu_chere");
var_prix_essence = addMF(var_prix_essence, "trapmf", [1.4 1.8 2 2.2], "Name", "moyennement_chere");
var_prix_essence = addMF(var_prix_essence, "trapmf", [2 2.2 5 5], "Name", "chere");