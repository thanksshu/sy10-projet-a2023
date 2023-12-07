function rules = gen_rules_from_table(rule_table)
    rule_table_size = size(rule_table);
    
    % Generate conbinations of all inputs
    elements = arrayfun(@(x) 1:x, rule_table_size, 'uniformoutput', false);
    combinations = cell(1, numel(elements));
    [combinations{:}] = ndgrid(elements{:}); % Generate using grid
    combinations = cellfun(@(x) x(:), combinations, ...
                           'uniformoutput', false);
    inputs = [combinations{:}];
    
    outputs = reshape(rule_table, 1, [])'; % Generate outputs that fits inputs
    weights = ones([1 prod(rule_table_size)])'; % Toujours = 1
    operators = ones([1 prod(rule_table_size)])';% Toujour ET

    rules = [inputs outputs weights operators];
end