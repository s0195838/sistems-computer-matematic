
clear; clc; close all;


% ЗАДАНИЕ 1. Графики функций одной переменной


% Вызов файл-функций и построение
figure('Name', 'Задание 1');

% u(x)
subplot(2,2,1);
x = linspace(0, 2*pi, 500);
y = u_func(x);
plot(x, y, 'b-', 'LineWidth', 1.5); grid on;
title('u(x) = sin(ln(x+1)) + cos(ln(x+1))');
xlabel('x'); ylabel('u(x)');

% f(x)
subplot(2,2,2);
x = linspace(-0.9, 0.9, 500);
y = f_func(x);
plot(x, y, 'r--', 'LineWidth', 1.5); grid on;
title('f(x) = 1/(1+1/(1+x))');
xlabel('x'); ylabel('f(x)');

% g(x)
subplot(2,2,3);
x = linspace(0.5, 1.5, 500);
y = g_func(x);
plot(x, y, 'm-.', 'LineWidth', 1.5); grid on;
title('g(x) = x^x');
xlabel('x'); ylabel('g(x)');

% h(x)
subplot(2,2,4);
x = linspace(0, 1, 500);
y = h_func(x);
plot(x, y, 'k:', 'LineWidth', 1.5); grid on;
title('h(x) = sin(6\pi|x-2/3|^2)');
xlabel('x'); ylabel('h(x)');


% ЗАДАНИЕ 2. Поверхности


% z(x,y)
figure('Name', 'z(x,y)');
[X, Y] = meshgrid(linspace(-1, 1, 50));
Z = z_func(X, Y);
surf(X, Y, Z);
title('z(x,y) = e^{3x sin(0.5y)} + e^{3y sin(0.5x)}');
xlabel('x'); ylabel('y'); zlabel('z');

% w(x,y)
figure('Name', 'w(x,y)');
[X, Y] = meshgrid(linspace(0, 1, 50));
W = w_func(X, Y);
surf(X, Y, W);
title('w(x,y) = sin(e^{2x}-e^{-2y}) + cos(e^{2y}-e^{-2x})');
xlabel('x'); ylabel('y'); zlabel('w');

% ЗАДАНИЕ 3. Файл-функции для задач


% Тестовые данные
v = [3 7 1 9 4 6 2 8 5];
M = [2 5 8; 1 4 7; 3 6 9];
xv = [0 1 2 1 0];
yv = [0 0 1 2 1];

fprintf('=== Задание 3 ===\n');

% 3.1 Номер элемента с наибольшим отклонением от среднего
[idx, val] = max_dev(v);
fprintf('1. Индекс макс. отклонения: %d, значение: %g\n', idx, val);

% 3.2 Сумма элементов с нечетными индексами
s_odd = sum_odd_idx(v);
fprintf('2. Сумма нечетных индексов: %g\n', s_odd);

% 3.3 Максимальное значение среди диагональных элементов
d_max = max_diag(M);
fprintf('3. Макс. диагональный: %g\n', d_max);

% 3.4 Переставить первый столбец с диагональю
M_swapped = swap_col1_diag(M);
fprintf('4. Матрица после замены:\n'); disp(M_swapped);

% 3.5 Сумма внедиагональных элементов
s_off = sum_off_diag(M);
fprintf('5. Сумма внедиагональных: %g\n', s_off);

% 3.6 Заменить максимальный элемент вектора средним значением
v_rep = replace_max_with_mean(v);
fprintf('6. Вектор после замены: [%s]\n', num2str(v_rep));

% 3.7 Заменить элемент (1,1) произведением всех элементов
M_prod = replace_11_with_prod(M);
fprintf('7. Матрица после замены (1,1):\n'); disp(M_prod);

% 3.8 Построить многоугольник
figure('Name', 'Многоугольник');
plot_polygon(xv, yv);
title('Многоугольник');

% 3.9 Отобразить элементы вектора синими, максимальный — красным
[max_val_out, max_idx_out] = plot_max_red(v);
fprintf('9. Макс. значение: %g, индекс: %d\n', max_val_out, max_idx_out);


% Файл-функции для заданий


%Функции задания 1

function y = u_func(x)
    y = sin(log(x+1)) + cos(log(x+1));
end

function y = f_func(x)
    y = 1 ./ (1 + 1./(1+x));
end

function y = g_func(x)
    y = x.^x;
end

function y = h_func(x)
    y = sin(6*pi*abs(x - 2/3).^2);
end

% Функции задания 2

function z = z_func(x, y)
    z = exp(3*x.*sin(0.5*y)) + exp(3*y.*sin(0.5*x));
end

function w = w_func(x, y)
    w = sin(exp(2*x) - exp(-2*y)) + cos(exp(2*y) - exp(-2*x));
end

% Функции задания 3
function [idx, val] = max_dev(v)
    avg = mean(v);
    dev = abs(v - avg);
    [val, idx] = max(dev);
end

function s = sum_odd_idx(v)
    s = sum(v(1:2:end));
end

function m = max_diag(M)
    m = max(diag(M));
end

function M = swap_col1_diag(M)
    n = size(M,1);
    d = diag(M);
    M(1:n,1) = d;
    M(1:n+1:n*n) = M(:,1);
end

function s = sum_off_diag(M)
    s = sum(M(:)) - sum(diag(M));
end

function v = replace_max_with_mean(v)
    v(v == max(v)) = mean(v);
end

function M = replace_11_with_prod(M)
    M(1,1) = prod(M(:));
end

function plot_polygon(x, y)
    plot([x, x(1)], [y, y(1)], 'b-o', 'LineWidth', 1.5);
    axis equal; grid on;
    xlabel('x'); ylabel('y');
end

function [max_val, max_idx] = plot_max_red(v)
    [max_val, max_idx] = max(v);
    figure;
    plot(1:length(v), v, 'b.', 'MarkerSize', 15); hold on;
    plot(max_idx, max_val, 'r.', 'MarkerSize', 20);
    grid on;
    xlabel('Индекс'); ylabel('Значение');
    title('Элементы вектора');
    legend('Элементы', 'Максимум');
end