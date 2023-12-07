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

%     y = zeros(1, length(x));
%     for i = 1:length(x)
%         if x(i) <= params(3)
%             y(i) = 1;
%         elseif x(i) <= params(4)
%             y(i) = (x(i) - params(4)) / (params(3) - params(4)) * (1 - 0) + 0;
%         elseif x(i) <= params(5)
%             y(i) = 0;
%         elseif x(i) <= params(6)
%             y(i) = (x(i) - params(6)) / (params(5) - params(6)) * (0 - 1) + 1;
%         elseif x(i) <= params(7)
%             y(i) = 1;
%         end
%     end
end