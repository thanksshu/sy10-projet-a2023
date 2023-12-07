run("vars/pollution.m");
run("vars/prix_essence.m");

run("vars/coeff_econo_ecolo.m");

fis_sf04 = mamfis("Name", "sf04");
fis_sf04.inputs(1) = var_pollution;
fis_sf04.inputs(2) = var_prix_essence;

fis_sf04.outputs(1) = var_coeff_econo_ecolo;

table = [1 2 2; 1 2 3; 2 2 3];

fis_sf04 = addRule(fis_sf04, gen_rules_from_table(table));
