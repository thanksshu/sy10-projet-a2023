
var_nb_bus_2h = fisvar([0 500], "Name", "nb_bus_2h");
var_nb_bus_2h = addMF(var_nb_bus_2h, "trapmf", [0 0 entree.nb_bus*0.3 entree.nb_bus*0.4], "Name", "tres_petit");
var_nb_bus_2h = addMF(var_nb_bus_2h, "trapmf", [entree.nb_bus*0.3 entree.nb_bus*0.4 entree.nb_bus*0.6 entree.nb_bus*0.7], "Name", "petit");
var_nb_bus_2h = addMF(var_nb_bus_2h, "trapmf", [entree.nb_bus*0.6 entree.nb_bus*0.7 entree.nb_bus*0.8 entree.nb_bus*0.9], "Name", "moyen");
var_nb_bus_2h = addMF(var_nb_bus_2h, "trapmf", [entree.nb_bus*0.8 entree.nb_bus*0.9 entree.nb_bus entree.nb_bus], "Name", "eleve");