var_limitation_bus = fisvar([0 20], "Name", "limitation_bus");
var_limitation_bus = addMF(var_limitation_bus, "trapmf", [0 0 6 10], "Name", "peu");
var_limitation_bus = addMF(var_limitation_bus, "trapmf", [8 10 12 14], "Name", "moyen");
var_limitation_bus = addMF(var_limitation_bus, "trapmf", [12 16 100 100], "Name", "beaucoup");
