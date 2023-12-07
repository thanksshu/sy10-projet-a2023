function out = defuzzy(fis, x, consequent)
    mfs = fis.outputs(1).mf
    mf = zeros(1, length(x));
    for i = 1:length(mfs)
        mf_par = mfs(i);
        mf_func = str2func(mf_par.type);
        mf_tronq = mf_func(x, mf_par.parameters) * consequent(i) % T-trocature
        mf = max(mf_tronq, mf);
    end
    out = defuzz(x, mf, "centroid")
end