function out = defuzzy(fis, x, consequent)
    x = 0:0.1:50;
    consequent = [0.2, 0.6, 1, 1, 1];

    mfs = fis_sf01.outputs(1).mf
    mf = zeros(1, length(x));
    for i = 1:length(mfs)
        mf_par = mfs(i);
        mf_func = str2func(mf_par.type);
        mf_tronq = mf_func(x, mf_par.parameters) * consequent(i) % T-trocature
        mf = max(mf_tronq, mf);
    end

    figure('Tag','defuzz')
    plot(x,mf,'LineWidth',3)

    out = defuzz(x, mf, "centroid")
end