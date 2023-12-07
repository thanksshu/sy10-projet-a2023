run("vars/neige_au_sol.m");
run("vars/luminosite.m");

run("vars/envie_de_sortir.m");

fis_sf07 = mamfis("Name", "sf07");
fis_sf07.inputs(1) = var_neige_au_sol;
fis_sf07.inputs(2) = var_luminosite;

fis_sf07.outputs(1) = var_envie_de_sortir;

table = [2 3 4 4; 1 2 3 3; 1 1 2 2];

fis_sf07 = addRule(fis_sf07, gen_rules_from_table(table));
