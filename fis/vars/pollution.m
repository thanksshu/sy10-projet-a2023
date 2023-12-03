var_pollution = fisvar([0 300], "Name", "pollution");
var_pollution = addMF(var_pollution, "trapmf", [0 0 30 60], "Name", "faible");
var_pollution = addMF(var_pollution, "trapmf", [50 70 90 110], "Name", "moyenne");
var_pollution = addMF(var_pollution, "trapmf", [90 140 300 300], "Name", "forte");