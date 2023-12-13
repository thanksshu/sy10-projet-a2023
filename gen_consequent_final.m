function mf_final = gen_consequent_final(fis, x, consequent)
    mfs = fis.outputs(1).mf;
    mf_final = zeros(1, length(x));
    for i = 1:length(mfs)
        mf_par = mfs(i);
        mf_func = str2func(mf_par.type);
        mf_tronq = mf_func(x, mf_par.parameters);
        mf_tronq(mf_tronq > consequent(i)) = consequent(i); % T-trocature
        mf_final = max(mf_tronq, mf_final); % Max-union
    end
end