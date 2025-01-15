clc; clear; close;

% Veriler
% Bağımsız değişkenler (x) 
x = [609 629 620 564 645 493 606 660 630 672 778 616 727 810 778 823 755 710 701 803 855 838 830 864 635 565 562 580 596 597 636 559 615 740 677 675 629 692 710 730 763 686 717 737 816];
% Bağımlı değişkenler (y)
y = [241 222 233 207 247 189 226 240 215 231 263 220 271 284 279 272 268 278 238 255 308 281 288 306 236 204 216 225 220 219 201 213 228 234 237 217 211 238 221 281 292 251 231 275 275];

% Verilerin sayısı
n = length(x);

% Ortalama hesaplama (manuel)
x_sum = 0;
y_sum = 0;

for i = 1:n
    x_sum = x_sum + x(i);
    y_sum = y_sum + y(i);
end

x_mean = x_sum / n; % x'in ortalaması
y_mean = y_sum / n; % y'nin ortalaması

% Eğim (slope) hesaplama (manuel)
numerator = 0; % Pay
denominator = 0; % Payda

for i = 1:n
    numerator = numerator + (x(i) - x_mean) * (y(i) - y_mean);
    denominator = denominator + (x(i) - x_mean)^2;
end

slope = numerator / denominator; % Eğim hesaplama

% Kesim noktası (intercept) hesaplama (manuel)
intercept = y_mean - slope * x_mean; % Kesim noktası hesaplama

% Regresyon denklemi
fprintf('Regresyon denklemi: y = %.2f + %.2fx\n', intercept, slope);

% Yeni y tahmin vektörü
y_tahmin = []; % Boş bir vektör oluştur

% y tahminlerini hesaplama
for i = 1:n
    y_tahmin(i) = intercept + slope * x(i); % Regresyon denklemi ile y'yi hesapla
end

% Tahmin edilen y değerlerini yazdırma
fprintf('Tahmin edilen y değerleri:\n');
for i = 1:n
    fprintf('x = %.2f için y = %.2f\n', x(i), y_tahmin(i));
end

% Saçılım grafiği
figure;
scatter(x, y, 'filled'); % Verileri saçılım grafiği ile göster
hold on;
x_fit = linspace(min(x), max(x), 100); % Uygun x değerleri
y_fit = intercept + slope * x_fit; % Regresyon doğrusunu hesapla
plot(x_fit, y_fit, 'r-', 'LineWidth', 2); % Regresyon doğrusunu çiz
scatter(x, y_tahmin, 'bo', 'filled'); % Tahmin edilen y değerlerini göster
xlabel('X Değerleri');
ylabel('Y Değerleri');
title('Saçılım Grafiği ve Regresyon Doğrusu');
legend('Veriler', 'Regresyon Doğrusu', 'Tahmin Edilen Y Değerleri');
grid on;
hold off;