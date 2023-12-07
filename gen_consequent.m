function consequent = gen_consequent(fis, irr)
    % Le AND et THEN sont modélisés par la T-norme min.
    declenchement = min(irr, [], 2); % min de chaque ligne

    % Conséquence par max-union de tous les conséquences floues partielles
    consequent = zeros(1, length(fis.output.mf));
    for i = 1:length(fis.rule)
        consequent(fis.rule(i).consequent) = ...
        max(consequent(fis.rule(i).consequent), declenchement(i));
    end
end