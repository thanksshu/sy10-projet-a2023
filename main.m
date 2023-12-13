clc;
clearvars;
close all;

%% 

addpath("fis");
addpath("fis/vars");

run("fis/sf01.m");
run("fis/sf02.m");
run("fis/sf03.m");
run("fis/sf04.m");
run("fis/sf05.m");
run("fis/sf06.m");
run("fis/sf07.m");
run("fis/sf08.m");
run("fis/sf09.m");
run("fis/sf10.m");

%% 
range_nb_personnes = 0:100;
range_choix_prendre_le_bus = 0:0.01:1;

entree = jsondecode(fileread("input.json"));

%% 
nb_ligne = length(entree.lignes);
nb_personne_in_bus_pour_chaque_ligne = zeros(nb_ligne, 1);

for ligne = 1:nb_ligne
    % SF01: trois entrées scalaires
    [~, irr_sf01, ~, ~] = evalfis(fis_sf01, ...
        [entree.vent, entree.pluie, entree.temperature]);
    ressentie_meteo = gen_consequent(fis_sf01, irr_sf01);

    % SF02 : deux entrées scalaires
    [~, irr_sf02, ~, ~] = evalfis(fis_sf02, ...
        [entree.etat_du_ciel, entree.jour_nuit]);
    luminosite = gen_consequent(fis_sf02, irr_sf02);

    % CAF01: deux entrées floue
    horaires_quotidiens = trimf(range_nb_personnes, ...
        entree.lignes(ligne).horaire_quotidien);
    evenement_exceptionnel = trimf(range_nb_personnes, ...
        entree.lignes(ligne).evenement_exceptionnel);
    evenement_prevu = fuzarith(range_nb_personnes, ...
        horaires_quotidiens, evenement_exceptionnel, "sum");

    % SF07 : une entrée scalaire et une entrée consequent
    degrees_neige_au_sol = evalvar(fis_sf07.inputs(1), ...
        entree.neige_au_sol);
    irr_sf07 = gen_irr(fis_sf07, ...
        {degrees_neige_au_sol, luminosite});
    envie_de_sortir = gen_consequent(fis_sf07, irr_sf07);

    % SF08 : deux entrées consequent
    irr_sf08 = gen_irr(fis_sf08, ...
        {ressentie_meteo, envie_de_sortir});
    choix_prendre_le_bus = gen_consequent(fis_sf08, irr_sf08);
    choix_prendre_le_bus = gen_consequent_final(fis_sf08, ...
        range_choix_prendre_le_bus, choix_prendre_le_bus);

    % CAF03 : une entrée scalaire et une entrée floue
    nb_personne_in_bus = fuzarith(range_nb_personnes, ...
        choix_prendre_le_bus, evenement_prevu, "prod"); % TODO
end


%% 

% SF03 : une entrée scalaire et une entrée consequent
% TODO

% SF09 : deux entrées consequent
irr_sf09 = gen_irr(fis_sf09, ...
    {nb_personne_in_bus, nb_p_changer_ligne});
nb_tot_personne_ligne_bus = gen_consequent(fis_sf09, irr_sf09);

% SF04 : deux entrées scalaires
[~, irr_sf04, ~, ~] = evalfis(fis_sf04, [pollution prix_essence]);
coeff_econo_ecolo = gen_consequent(fis_sf04, irr_sf04);

% SF10 : deux entrées consequent
irr_sf10 = gen_irr(fis_sf10, ...
    {nb_tot_personne_ligne_bus, coeff_econo_ecolo});
nb_bus_envoye = gen_consequent(fis_sf10, irr_sf10);

%% 

% SF05: trois entrées scalaires
[~, irr_sf05, ~, ~] = evalfis(fis_sf05, [nb_chauffeur pause_chauffeur temps_circulation]);
nb_chauffeur_2h = gen_consequent(fis_sf05, irr_sf05);

% SF06: trois entrées scalaires
[~, irr_sf06, ~, ~] = evalfis(fis_sf06, [temps_circulation nb_bus autonomie_bus]);
nb_bus_2h = gen_consequent(fis_sf06, irr_sf06);
