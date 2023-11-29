var_jour_nuit = fisvar([0 50], "Name", "jour_nuit");
var_jour_nuit = addMF(var_jour_nuit, "trapmf", [0 0 1 2], "Name", "dégagé");
var_jour_nuit = addMF(var_jour_nuit, "trapmf", [1 2 5 6], "Name", "épars");
var_jour_nuit = addMF(var_jour_nuit, "trapmf", [5 6 9 10], "Name", "fragmenté");
var_jour_nuit = addMF(var_jour_nuit, "trapmf", [9 10 10 10], "Name", "couvert");
