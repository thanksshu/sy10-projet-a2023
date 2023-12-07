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
run("fis/sf11.m");
run("fis/caf01.m");
run("fis/caf02.m");
run("fis/caf03.m");

%% 

vent = 1;
temperature = 1;
pluie = 1;
neige_au_sol = 1;
etat_du_ciel = 1;
jour_nuit = 1;
%  
%
nb_arret = 1;
personnes_autres_lignes = 1;
pollution = 1;
prix_essence = 1;
nb_chauffeur = 1;
pause_chauffeur = 1;
temps_circulation = 1;
nb_bus = 1;
autonomie_bus = 1;

%% 

% SF01: trois entrées scalaires
[~, irr_sf01, ~, ~] = evalfis(fis_sf01, [vent pluie temperature]);
ressentie_meteo = gen_consequent(fis_sf01, irr_sf01);

% SF02 : deux entrées scalaires
[~, irr_sf02, ~, ~] = evalfis(fis_sf02, [etat_du_ciel jour_nuit]);
luminosite = gen_consequent(fis_sf02, irr_sf02);

% CAF01: deux entrées scalaires
% TODO

% SF07 : une entrée scalaire et une entrée floue
degrees_neige_au_sol = evalvar(fis_sf07.inputs(1), neige_au_sol);
irr_sf07 = gen_irr(fis_sf07, ...
    {degrees_neige_au_sol, luminosite});
envie_de_sortir = gen_consequent(fis_sf07, irr_sf07);

% SF08 : deux entrées floue
irr_sf08 = gen_irr(fis_sf08, ...
    {ressentie_meteo, envie_de_sortir});
choix_prendre_le_bus = gen_consequent(fis_sf08, irr_sf08);

% CAF03
% TODO

%% 

% SF03 : une entrée scalaire et une entrée floue
% TODO

% SF09 : deux entrées floue
irr_sf09 = gen_irr(fis_sf09, ...
    {nb_personne_in_bus, nb_p_changer_ligne});
nb_tot_personne_ligne_bus = gen_consequent(fis_sf09, irr_sf09);

% SF04 : deux entrées scalaires
[~, irr_sf04, ~, ~] = evalfis(fis_sf04, [pollution prix_essence]);
coeff_econo_ecolo = gen_consequent(fis_sf04, irr_sf04);

% SF10 : deux entrées floue
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

% CAF02
% TODO
