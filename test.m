clc;
clearvars;
close all;

neige_au_sol;
fis_test = mamfis("Name", "test");
fis_test.inputs(1) = var_neige_au_sol;

figure();
plotmf(fis_test, "input", 1);