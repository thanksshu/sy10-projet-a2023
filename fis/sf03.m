run("vars/nb_arret.m");
run("vars/personnes_autres_lignes.m");


run("vars/nb_p_changer_ligne.m");

fis_sf03 = mamfis("Name", "sf03");
fis_sf03.inputs(1) = var_nb_arret;
fis_sf03.inputs(2) = var_personnes_autres_lignes;

fis_sf03.outputs(1) = var_nb_p_changer_ligne;

table = [1 1 2 ; 1 2 3 ; 2 3 3];

fis_sf03 = addRule(fis_sf03, gen_rules_from_table(table));
