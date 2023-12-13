var_choix_prendre_le_bus = fisvar([0 1], "Name", "choix_prendre_le_bus");
var_choix_prendre_le_bus = addMF(var_choix_prendre_le_bus, "trapmf", [0 0 0.1 0.2], "Name", "très faible");
var_choix_prendre_le_bus = addMF(var_choix_prendre_le_bus, "trapmf", [0.15 0.2 0.25 0.28], "Name", "faible");
var_choix_prendre_le_bus = addMF(var_choix_prendre_le_bus, "trapmf", [0.25 0.28 0.35 0.4], "Name", "moyen");
var_choix_prendre_le_bus = addMF(var_choix_prendre_le_bus, "trapmf", [0.35 0.4 1 1], "Name", "fort");
