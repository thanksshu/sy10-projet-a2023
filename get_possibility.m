function possibility = get_possibility(fismf, x, values)
    mf_func = str2func(fismf.type);
    mf = mf_func(x, fismf.parameters);
    intersection = min(values, mf); % Min-intersection
    possibility = max(intersection);
end