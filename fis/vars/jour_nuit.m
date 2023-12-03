var_jour_nuit = fisvar([0 24], "Name", "jour_nuit");
var_jour_nuit = addMF(var_jour_nuit, "custmf_nuit", [0 0 6.5 7.2 17.5 18.5 24 24 1], "Name", "nuit");
var_jour_nuit = addMF(var_jour_nuit, "trapmf", [6.5 7.2 7.7 8.2], "Name", "aurore");
var_jour_nuit = addMF(var_jour_nuit, "trapmf", [7.7 8.2 16.5 17.5], "Name", "jour");
var_jour_nuit = addMF(var_jour_nuit, "trapmf", [17.25 17.25 17.75 18.25], "Name", "crépuscule");
