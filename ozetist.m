function [ortalama, varyans, q1, medyan, q3] = ozetist(x)
    % 1. Ortalama hesaplama
    n = length(x);
    toplam = 0;
    for i = 1:n
        toplam = toplam + x(i); % Elemanları toplar
    end
    ortalama = toplam / n; % Ortalamayı hesaplar

    % 2. Varyans hesaplama
    toplam2 = 0;
    for i = 1:n
        toplam2 = toplam2 + (x(i) - ortalama)^2; % Ortalamadan farkların kareleri
    end
    varyans = toplam2 / (n - 1); % Varyansı hesaplar (örnek varyansı)

    % 3. Sıralama (Bubble Sort)
    y = x; % Orijinal diziyi korumak için kopya oluştur
    for i = 1:n-1
        for j = i+1:n
            if y(j) < y(i) % Küçükten büyüğe sıralama
                temp = y(i);
                y(i) = y(j);
                y(j) = temp;
            end
        end
    end

    % 4. Medyan hesaplama
    modsayisi = n;
    while modsayisi < 0
        modsayisi = modsayisi + 2;
    end

    while modsayisi >= 2
        modsayisi = modsayisi - 2;
    end

    if modsayisi == 1
        medyan = y((n + 1) / 2); % Tek sayıda eleman varsa
    else
        medyan = (y(n / 2) + y(n / 2 + 1)) / 2; % Çift sayıda eleman varsa
    end

    % 5. Q1 ve Q3 hesaplama
    if modsayisi == 1
        % Tek sayıda eleman varsa, medyanın sol ve sağındaki diziler
        sol = y(1:(n - 1) / 2);
        sag = y((n + 1) / 2 + 1:end);
    else
        % Çift sayıda eleman varsa, medyanın sol ve sağındaki diziler
        sol = y(1:n / 2);
        sag = y((n / 2 + 1):end);
    end

    % Q1 hesaplama
    n_sol = length(sol);
    modsayisi_sol = n_sol;
    while modsayisi_sol < 0
        modsayisi_sol = modsayisi_sol + 2;
    end

    while modsayisi_sol >= 2
        modsayisi_sol = modsayisi_sol - 2;
    end

    if modsayisi_sol == 1
        q1 = sol((n_sol + 1) / 2); % Tek sayıda eleman varsa
    else
        q1 = (sol(n_sol / 2) + sol(n_sol / 2 + 1)) / 2; % Çift sayıda eleman varsa
    end

    % Q3 hesaplama
    n_sag = length(sag);
    modsayisi_sag = n_sag;
    while modsayisi_sag < 0
        modsayisi_sag = modsayisi_sag + 2;
    end

    while modsayisi_sag >= 2
        modsayisi_sag = modsayisi_sag - 2;
    end

    if modsayisi_sag == 1
        q3 = sag((n_sag + 1) / 2); % Tek sayıda eleman varsa
    else
        q3 = (sag(n_sag / 2) + sag(n_sag / 2 + 1)) / 2; % Çift sayıda eleman varsa
    end
end