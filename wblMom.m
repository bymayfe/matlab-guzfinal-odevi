 function f = wblMom(p, x)
    n = length(x);
    
    % Örnek ortalama (mean) hesaplama
    sample_mean = 0;
    for i = 1:n
        sample_mean = sample_mean + x(i);
    end
    sample_mean = sample_mean / n;

    % Örnek varyansı (var) hesaplama
    sample_var = 0;
    for i = 1:n
        sample_var = sample_var + (x(i) - sample_mean)^2;
    end
    sample_var = sample_var / n; % Popülasyon varyansı için

    % Weibull dağılımının teorik moment formülleri:
    % E[X] = beta * gamma(1 + 1/alfa)
    % Var[X] = beta^2 * (gamma(1 + 2/alfa) - (gamma(1 + 1/alfa))^2)

    % Moment eşitliklerini oluştur:
    % Birinci moment (E[X] eşitliği)
    f(1) = p(2) * gamma(1 + 1/p(1)) - sample_mean;

    % İkinci moment (Var[X] eşitliği)
    f(2) = p(2)^2 * (gamma(1 + 2/p(1)) - (gamma(1 + 1/p(1)))^2) - sample_var;
end
