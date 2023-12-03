var_horaire_quotidien = fisvar([0 50], "Name", "jour_nuit");
var_horaire_quotidien = addMF(var_horaire_quotidien, "trapmf", [0 0 3 5], "Name", "peu");
var_horaire_quotidien = addMF(var_horaire_quotidien, "trapmf", [4 5 7 8], "Name", "moyen");
var_horaire_quotidien = addMF(var_horaire_quotidien, "trapmf", [6 8 10 12], "Name", "beaucoup");