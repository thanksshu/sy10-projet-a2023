function degrees = evalvar_fuzzy(fisvar, x, values)
    mfs = fisvar.mf;
    degrees = zeros(1, length(mfs));
    for i = 1:length(mfs)
        degrees(i) = get_possibility(mfs(i), x, values);
    end
end