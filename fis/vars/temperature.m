var_temperature = fisvar([-15 50], "Name", "temperature");
var_temperature = addMF(var_temperature, "trapmf", [-15 -15 10 15], "Name", "froid");
var_temperature = addMF(var_temperature, "trapmf", [12 18 24 28], "Name", "tempéré");
var_temperature = addMF(var_temperature, "trapmf", [26 30 50 50], "Name", "chaud");
