run("vars/nb_bus.m");
run("vars/autonomie_bus.m");
run("vars/temps_circulation.m");

run("vars/nb_bus_2h.m");

fis_sf06 = mamfis("Name", "sf06");
fis_sf06.inputs(1) = var_nb_bus;
fis_sf06.inputs(2) = var_autonomie_bus;
fis_sf06.inputs(3) = var_temps_circulation;

fis_sf06.outputs(1) = var_nb_bus_2h;

table = cat(3, [3 2 2 ; 4 3 3 ; 3 3 3], [2 2 1 ; 3 3 2 ; 4 4 3], [2 2 1 ; 3 2 2 ; 4 3 2]);

fis_sf06 = addRule(fis_sf06, gen_rules_from_table(table));

