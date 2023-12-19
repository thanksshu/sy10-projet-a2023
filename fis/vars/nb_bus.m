var_nb_bus = fisvar([0 500], "Name", "nb_bus");
var_nb_bus = addMF(var_nb_bus, "trapmf", [0 0 17 18], "Name", "peu");
var_nb_bus = addMF(var_nb_bus, "trapmf", [17 18 20 21], "Name", "moyen");
var_nb_bus = addMF(var_nb_bus, "trapmf", [20 22 500 500], "Name", "eleve");