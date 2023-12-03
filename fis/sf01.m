run("vars/vent.m");
run("vars/temperature.m");
run("vars/pluie.m");

run("vars/ressentie_meteo.m");

fis_sf01 = mamfis("Name", "sf01");
fis_sf01.inputs(1) = var_vent;
fis_sf01.inputs(2) = var_pluie;
fis_sf01.inputs(3) = var_temperature;

fis_sf01.outputs(1) = var_ressentie_meteo;

table = cat(3, [3 2 1 ; 3 2 1 ; 2 1 1], [5 4 2 ; 5 3 2 ; 4 2 1], [5 3 2 ; 4 2 2 ; 3 2 1]);

fis_sf01 = addRule(fis_sf01, gen_rules_from_table(table));
