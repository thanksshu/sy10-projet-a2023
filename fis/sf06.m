run("vars/ressentie_meteo.m");
run("vars/envie_de_sortir.m");

run("vars/choix_prendre_le_bus.m");

fis_sf08 = mamfis("Name", "sf07");
fis_sf08.inputs(1) = var_ressentie_meteo;
fis_sf08.inputs(2) = var_envie_de_sortir;

fis_sf08.outputs(1) = var_choix_prendre_le_bus;

table = [1 1 2 1; 1 3 3 2; 2 4 4 2; 2 3 3 2; 1 2 2 1];

fis_sf08 = addRule(fis_sf08, gen_rules_from_table(table));
