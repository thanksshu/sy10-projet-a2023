clc;
clearvars;
close all;

temperature;
fis_test = mamfis("Name", "test");
fis_test.inputs(1) = var_temperature;

figure();
plotmf(fis_test, "input", 1);
