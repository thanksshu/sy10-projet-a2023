N = 500;
minX = 0;
maxX = 500;
x = linspace(minX,maxX,N);

horaire_quotidien = gaussmf(x,[2 25]); %deuxième chiffre = nombre de personnes attendues horaire quotidien
evenement_exeptionnel = gaussmf(x,[5 60]); %deuxième chiffre = nombre de personnes attendues evenement quotidien

resultat_caf01 = fuzarith(x,horaire_quotidien ,evenement_exeptionnel,'sum');

%pour afficher la somme de CAF01
%figure
%plot(x,horaire_quotidien,'--',x,evenement_exeptionnel,':',x,resultat_caf01,'c')
%title('Fuzzy Addition, A+B')
%legend('A','B','A+B')