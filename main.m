clc;
clearvars;
close all;

%% 

<<<<<<< HEAD
entree = jsondecode(fileread("tests/test_3.json"));
=======
entree = jsondecode(fileread("tests/test_5.json"));
>>>>>>> fb7390449e9c6d5c165e92fd32c19cabcb3aac06

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
resolution = 0.01;
min_limit = 0; 
max_limit = 1000;
range = min_limit:resolution:max_limit;

nb_ligne = length(entree.lignes);

%% 

% SF01: trois entrées scalaires
[~, irr_sf01, ~, ~] = evalfis(fis_sf01, ...
    [entree.vent, entree.pluie, entree.temperature]);
degrees_ressentie_meteo = gen_degree_declenchement(fis_sf01, irr_sf01);

% SF02 : deux entrées scalaires
[~, irr_sf02, ~, ~] = evalfis(fis_sf02, ...
    [entree.etat_du_ciel, entree.jour_nuit]);
degrees_luminosite = gen_degree_declenchement(fis_sf02, irr_sf02);

% SF07 : une entrée scalaire et une entrée consequent
degrees_neige_au_sol = evalvar_scalar(fis_sf07.inputs(1), ...
    entree.neige_au_sol);
irr_sf07 = gen_irr(fis_sf07, ...
    {degrees_neige_au_sol, degrees_luminosite});
degrees_envie_de_sortir = gen_degree_declenchement(fis_sf07, irr_sf07);

% SF08 : deux entrées consequent
irr_sf08 = gen_irr(fis_sf08, ...
    {degrees_ressentie_meteo, degrees_envie_de_sortir});
degrees_choix_prendre_le_bus = gen_degree_declenchement(fis_sf08, irr_sf08);
discrete_choix_prendre_le_bus = gen_consequent_final(fis_sf08, ...
    range, degrees_choix_prendre_le_bus);

choix_prendre_le_bus = defuzz(range, discrete_choix_prendre_le_bus, "centroid");

%%

% SF04 : deux entrées scalaires
[~, irr_sf04, ~, ~] = evalfis(fis_sf04, [entree.pollution entree.prix_essence]);
degrees_coeff_econo_ecolo = gen_degree_declenchement(fis_sf04, irr_sf04);

%%

nbs_personne_in_bus = zeros(1, nb_ligne);
for ligne = 1:nb_ligne
    % CAF01: deux entrées floue
    discrete_horaires_quotidiens = trapmf(range, ...
        entree.lignes(ligne).horaire_quotidien);
    discrete_evenement_exceptionnel = trapmf(range, ...
        entree.lignes(ligne).evenement_exceptionnel);
    
    discrete_evenement_prevu = fuzarith(range, ...
        discrete_horaires_quotidiens, discrete_evenement_exceptionnel, "sum")';

    % CAF03 : une entrée scalaire et une entrée floue discrète
    discrete_choix_prendre_le_bus = zeros(1, length(range));
    discrete_choix_prendre_le_bus(round(choix_prendre_le_bus / resolution)) = 1;
    discrete_nb_personne_in_bus = fuzarith(range, ...
        discrete_choix_prendre_le_bus, discrete_evenement_prevu, "prod")';
    nbs_personne_in_bus(ligne) = defuzz(range, discrete_nb_personne_in_bus, "centroid");
end

%% 

nbs_personne_in_bus

nb_bus_envoye_pour_chaque_ligne = zeros(1, nb_ligne);
for ligne = 1:nb_ligne
    % SF03 : une entrée scalaire et une entrée floue discrète
    personnes_autres_lignes = (sum(nbs_personne_in_bus) - nbs_personne_in_bus(ligne));
    [~, irr_sf03, ~, ~] = evalfis(fis_sf03, [entree.lignes(ligne).nb_arret personnes_autres_lignes]);
    degrees_nb_p_changer_ligne = gen_degree_declenchement(fis_sf03, irr_sf03);

    % SF09 : une entrées consequent et une entrée floue discrète
    degrees_nb_personne_in_bus = evalvar_scalar(fis_sf09.input(1), nbs_personne_in_bus(ligne));
    irr_sf09 = gen_irr(fis_sf09, {degrees_nb_personne_in_bus , degrees_nb_p_changer_ligne});
    degrees_nb_tot_personne_ligne_bus = gen_degree_declenchement(fis_sf09, irr_sf09);

    % SF10 : deux entrées consequent
    irr_sf10 = gen_irr(fis_sf10, ...
        {degrees_nb_tot_personne_ligne_bus, degrees_coeff_econo_ecolo});
    degrees_nb_bus_envoye = gen_degree_declenchement(fis_sf10, irr_sf10);
    
    discrete_nb_bus_envoye = gen_consequent_final(fis_sf10, range, degrees_nb_bus_envoye);
    nb_bus_envoye_pour_chaque_ligne(ligne) = defuzz(range, ...
        discrete_nb_bus_envoye, "centroid");
end

%%

discrete_temps_circulation = trapmf(range, ...
        entree.temps_circulation);
degrees_temps_circulation = evalvar_fuzzy(fis_sf05.inputs(3), ...
    range, discrete_temps_circulation);

% SF05: deux entrées scalaires et une entrée floue 
degrees_nb_chauffeur = evalvar_scalar(fis_sf05.inputs(1), ...
entree.nb_chauffeur);
degrees_pause_chauffeur = evalvar_scalar(fis_sf05.inputs(2), ...
entree.pause_chauffeur);
irr_sf05 = gen_irr(fis_sf05, ...
    {degrees_nb_chauffeur, degrees_pause_chauffeur, degrees_temps_circulation});
degrees_nb_chauffeur_2h = gen_degree_declenchement(fis_sf05, irr_sf05);

discrete_nb_chauffeur_2h = gen_consequent_final(fis_sf05, range, degrees_nb_chauffeur_2h);
nb_chauffeur_2h = round(defuzz(range, discrete_nb_chauffeur_2h, "centroid"));

% SF06: deux entrées scalaires et une entrée floue
degrees_nb_bus = evalvar_scalar(fis_sf06.inputs(1), ...
entree.nb_bus);
degrees_autonomie_bus = evalvar_scalar(fis_sf06.inputs(2), ...
entree.autonomie_bus);
irr_sf06 = gen_irr(fis_sf06, ...
    {degrees_nb_bus, degrees_autonomie_bus, degrees_temps_circulation});
degrees_nb_bus_2h = gen_degree_declenchement(fis_sf06, irr_sf06);

discrete_nb_bus_2h = gen_consequent_final(fis_sf06, range, degrees_nb_bus_2h);
nb_bus_2h = round(defuzz(range, discrete_nb_bus_2h, "centroid"));

%%

disp("nb_bus_2h = " + nb_bus_2h);
disp("nb_chauffeur_2h = " + nb_chauffeur_2h);

if min(nb_bus_2h, nb_chauffeur_2h) < 6
    disp("pas assez de bus ou de chauffeur pour pouvoir assurer le service");
else
    disp(nb_bus_envoye_pour_chaque_ligne);
    while (sum(round(nb_bus_envoye_pour_chaque_ligne)) <= min(nb_bus_2h, nb_chauffeur_2h)) == 0
       nb_bus_envoye_pour_chaque_ligne = ...
           nb_bus_envoye_pour_chaque_ligne(nb_bus_envoye_pour_chaque_ligne > 0.5) - resolution;
    end
    disp(round(nb_bus_envoye_pour_chaque_ligne));
end

