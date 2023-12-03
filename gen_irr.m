function irr = gen_irr(fis, degrees_lists)
    rule_count = length(fis.rules);
    input_count = length(fis.inputs);
    irr =  zeros(rule_count, input_count);
    for i = 1:rule_count
        rule = fis.rules(i);
        for j = 1:input_count
            class_index = rule.antecedent(j); % Input class for this rule
            degrees = degrees_lists{j};
            irr(i, j) = degrees(class_index);
        end
    end
end