var_temps_circulation = fisvar([0 200], "Name", "temps_circulation");
var_temps_circulation = addMF(var_temps_circulation, "trapmf", [0 0 46 52], "Name", "court");
var_temps_circulation = addMF(var_temps_circulation, "trapmf", [48 50 52 54], "Name", "normal");
var_temps_circulation = addMF(var_temps_circulation, "trapmf", [52 54 200 200], "Name", "long");