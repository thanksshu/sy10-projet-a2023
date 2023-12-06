clc;
clearvars;
close all;

addpath("fis");
addpath("fis/vars");

run("fis/sf01.m");
run("fis/sf02.m");
run("fis/sf07.m");
run("fis/sf08.m");

% SF01: trois entrées scalaires
[~, irr_sf01, ~, ~] = evalfis(fis_sf01, [45 2.5 13]);
ressentie_meteo = gen_consequent(fis_sf01, irr_sf01);

% SF02 : deux entrées scalaires
[~, irr_sf02, ~, ~] = evalfis(fis_sf02, [6 10]);
luminosite = gen_consequent(fis_sf02, irr_sf02);

% SF07 : une entrée scalaire et une entrée floue
degrees_neige_au_sol = evalvar(fis_sf07.inputs(1), 8);
irr_sf07 = gen_irr(fis_sf07, ...
    {degrees_neige_au_sol, luminosite});
envie_de_sortir = gen_consequent(fis_sf07, irr_sf07);

% SF08 : deux entrées floue
irr_sf08 = gen_irr(fis_sf08, ...
    {ressentie_meteo, envie_de_sortir});
choix_prendre_le_bus = gen_consequent(fis_sf08, irr_sf08);
