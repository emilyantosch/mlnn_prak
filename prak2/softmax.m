function result = softmax(zeta)
    result = zeros(size(zeta));
    for tt = 1:size(zeta, 1)
        zeta = zeta - max(zeta(tt, :));
        for ii = 1:size(zeta, 2)
        result(tt, ii) = exp(zeta(tt, ii))/sum(exp(zeta(tt, :)));
        end
    end
end