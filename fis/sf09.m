run("vars/nb_personne_in_bus.m");
run("vars/nb_p_changer_ligne.m");

run("vars/nb_tot_personne_ligne_bus.m");

fis_sf09 = mamfis("Name", "sf09");
fis_sf09.inputs(1) = var_nb_personne_in_bus;
fis_sf09.inputs(2) = var_nb_p_changer_ligne;

fis_sf09.outputs(1) = var_nb_tot_personne_ligne_bus;

table = [1 1 2 ; 2 3 3 ; 3 3 4];

fis_sf09 = addRule(fis_sf09, gen_rules_from_table(table));
