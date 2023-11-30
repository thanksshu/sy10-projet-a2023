var_horaire_quotidien = fisvar([0 50], "Name", "jour_nuit");
var_horaire_quotidien = addMF(var_horaire_quotidien, "trapmf", [0 0 1 2], "Name", "dégagé");
var_horaire_quotidien = addMF(var_horaire_quotidien, "trapmf", [1 2 5 6], "Name", "épars");
var_horaire_quotidien = addMF(var_horaire_quotidien, "trapmf", [5 6 9 10], "Name", "fragmenté");
var_horaire_quotidien = addMF(var_horaire_quotidien, "trapmf", [9 10 10 10], "Name", "couvert");
