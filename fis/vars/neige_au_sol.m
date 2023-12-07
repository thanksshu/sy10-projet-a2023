var_neige_au_sol = fisvar([0 20], "Name", "neige_au_sol");
var_neige_au_sol = addMF(var_neige_au_sol, "trapmf", [0 0 0 4], "Name", "faible ");
var_neige_au_sol = addMF(var_neige_au_sol, "trapmf", [2 4 6 8], "Name", "moyen");
var_neige_au_sol = addMF(var_neige_au_sol, "trapmf", [6 15 20 20], "Name", "forte");
