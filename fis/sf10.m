run("vars/nb_tot_personne_ligne.m");
run("vars/coeff_econo_ecolo.m");

run("vars/nb_bus_envoye.m");

fis_sf10 = mamfis("Name", "sf10");
fis_sf10.inputs(1) = var_nb_tot_personne_ligne;
fis_sf10.inputs(2) = var_coeff_econo_ecolo;

fis_sf10.outputs(1) = var_nb_bus_envoye;

table = [2 2 1; 3 2 2; 4 3 3; 5 4 4];

fis_sf10 = addRule(fis_sf10, gen_rules_from_table(table));
