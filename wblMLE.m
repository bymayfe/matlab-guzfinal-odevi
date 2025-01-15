function f = wblMLE(p, x)
    n = length(x);
    
    % İlk terim için döngü kullanarak toplam hesaplama
    log_x_sum = 0;
    for i = 1:n
        log_x_sum = log_x_sum + log(x(i));
    end
    
    f(1) = n/p(1) + log_x_sum - n*log(p(2));
    
    % İkinci terim için döngü kullanarak toplam hesaplama
    sum_term = 0;
    for i = 1:n
        sum_term = sum_term + (x(i)/p(2))^p(1) * (log(x(i)) - log(p(2)));
    end
    f(1) = f(1) - sum_term;

    % İkinci fonksiyon terimi
    sum_x_p1 = 0;
    for i = 1:n
        sum_x_p1 = sum_x_p1 + x(i)^p(1);
    end
    f(2) = -n/p(2) - n*(p(1)-1)/p(2) + p(1) * p(2)^(-p(1)-1) * sum_x_p1;
end