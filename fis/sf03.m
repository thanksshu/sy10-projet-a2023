run("vars/nb_arret.m");
run("vars/personnes_autres_lignes.m");

run("vars/choix_prendre_le_bus.m");

fis_sf03 = mamfis("Name", "sf07");
fis_sf03.inputs(1) = var_nb_arret;
fis_sf03.inputs(2) = var_personnes_autres_lignes;

fis_sf03.outputs(1) = var_choix_prendre_le_bus;

table = [1 1 2 1; 1 3 3 2; 2 4 4 2; 2 3 3 2; 1 2 2 1];

fis_sf03 = addRule(fis_sf03, gen_rules_from_table(table));
