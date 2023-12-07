function y = custmf_nuit(x, params)
    if x <= params(3)
        y = 1;
    elseif x <= params(4)
        y = (x - params(4)) / (params(3) - params(4)) * (1 - 0) + 0;
    elseif x <= params(5)
        y = 0;
    elseif x <= params(6)
        y = (x - params(6)) / (params(5) - params(6)) * (0 - 1) + 1;
    elseif x <= params(7)
        y = 1;
    end
end