var_temps_circulation = fisvar([0 40], "Name", "temps_circulation");
var_temps_circulation = addMF(var_temps_circulation, "trapmf", [0 0 23 26], "Name", "court");
var_temps_circulation = addMF(var_temps_circulation, "trapmf", [24 25 26 27], "Name", "normal");
var_temps_circulation = addMF(var_temps_circulation, "trapmf", [26 27 40 40], "Name", "long");