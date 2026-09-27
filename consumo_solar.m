clc;
clear;
close all;

%% Tiempo
horas = 1:24;

%% a. Generación Solar
solar = zeros(1,24);

for h = 6:18
    solar(h) = 25 * sin(pi * (h - 6) / 12);
end

%% b. Generación Eólica
eolica = [8 9 7 10 9 11 8 12 10 9 11 13 ...
    10 8 12 11 9 13 10 12 9 11 8 10];

%% c. Generación Híbrida Total
generacion_total = solar + eolica;

%% d. Demanda de la Comunidad
demanda = [3 3 2 4 3 6 7 8 7 6 8 9 ...
    8 7 9 10 9 13 15 14 12 4 3 2];

%% Mostrar resultados
disp('Hora    Solar    Eolica    Generacion Total    Demanda');

for h = 1:24
    fprintf('%2d      %6.2f    %6.2f       %6.2f          %6.2f\n', ...
        h, solar(h), eolica(h), generacion_total(h), demanda(h));
end

%% e. Visualización Gráfica
figure;

plot(horas, generacion_total, '-o', 'LineWidth', 2, ...
    'Color', [0 0.6 0]);
hold on;

plot(horas, demanda, '-s', 'LineWidth', 2, ...
    'Color', [0.8 0 0]);

grid on;

xlabel('Tiempo (horas)');
ylabel('Potencia (kW)');

title('Generación Híbrida vs Demanda de la Comunidad');

legend('Generación Híbrida Total', 'Demanda de la Comunidad', ...
    'Location', 'best');

hold off;