run("vars/etat_du_ciel.m");
run("vars/jour_nuit.m");

run("vars/luminosite.m");

fis_sf02 = mamfis("Name", "sf02");
fis_sf02.inputs(1) = var_etat_du_ciel;
fis_sf02.inputs(2) = var_jour_nuit;

fis_sf02.outputs(1) = var_luminosite;

table = [2 3 4 3; 1 2 3 2; 1 1 2 1];

fis_sf02 = addRule(fis_sf02, gen_rules_from_table(table));
