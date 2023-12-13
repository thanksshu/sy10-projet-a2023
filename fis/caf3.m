N = 500;
minX = 0;
maxX = 500;
x = linspace(minX,maxX,N);

 %premiere variable : choix_prendre_bus compris entre 0 et 1 (c'est un coeff)
 % deuxieme variable : sortie de caf1 (nb_personne_prevu)

resultat_caf02 = fuzarith(x,horaire_quotidien ,nb_personne_prevu,'prod');

%pour afficher la multiplication de CAF02
%figure
%plot(x,horaire_quotidien,'--',x,evenement_exeptionnel,':',x,resultat_caf01,'c')
%title('Fuzzy Addition, A+B')
%legend('A','B','A+B')