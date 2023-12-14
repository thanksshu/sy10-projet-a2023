function degrees = gen_degree_declenchement(fis, irr)
    % Le AND et THEN sont modélisés par la T-norme min.
    partial_degrees = min(irr, [], 2); % min de chaque ligne

    % Conséquence par max-union de tous les conséquences floues partielles
    degrees = zeros(1, length(fis.output.mf));
    for i = 1:length(fis.rule)
        degrees(fis.rule(i).consequent) = ...
        max(degrees(fis.rule(i).consequent), partial_degrees(i));
    end
end