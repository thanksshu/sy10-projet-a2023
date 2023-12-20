run("vars/nb_chauffeur.m");
run("vars/pause_chauffeur.m");
run("vars/temps_circulation.m");

run("vars/nb_chauffeur_2h.m");

fis_sf05 = mamfis("Name", "sf05");
fis_sf05.inputs(1) = var_nb_chauffeur;
fis_sf05.inputs(2) = var_pause_chauffeur;
fis_sf05.inputs(3) = var_temps_circulation;

fis_sf05.outputs(1) = var_nb_chauffeur_2h;

table = cat(3, [3 2 2 ; 4 3 3 ; 4 4 4], [2 2 1 ; 3 3 2 ; 4 4 3], [2 2 1 ; 3 2 2 ; 4 3 2]);

fis_sf05 = addRule(fis_sf05, gen_rules_from_table(table));
