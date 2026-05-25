
clear; clc; close all;
% 1. Произведение элементов вектора, не превосходящих среднее арифметическое
v1 = [3 7 1 9 4 6 2 8 5];
p1 = prod_le_mean(v1);
fprintf('1. Произведение: %g\n', p1);
% 2. Число нулей и единиц в матрице
M2 = [1 0 2; 0 1 0; 1 1 0; 3 0 1];
[n0, n1] = count_zeros_ones(M2);
fprintf('2. Нулей: %d, единиц: %d\n', n0, n1);

% 3. Количество положительных элементов между max и min
v3 = [-2 5 -1 7 0 -3 4 -6 2];
c3 = pos_between_max_min(v3);
fprintf('3. Положительных между max и min: %d\n', c3);

% 4. Сумма отрицательных элементов ниже главной диагонали
M4 = [ 2 -3  1; -1  4 -2; -2  1 -3];
s4 = sum_neg_below_diag(M4);
fprintf('4. Сумма: %g\n', s4);

% 5. Заменить положительные элементы вектора суммой отрицательных
v5 = [-3 5 -1 7 0 -2 4 -6 2];
v5_new = replace_pos_with_sum_neg(v5);
fprintf('5. Результат: [%s]\n', num2str(v5_new));
% 6. Заполнить матрицу по формуле
A6 = fill_matrix(5);
fprintf('6. Матрица:\n'); disp(A6);

% 7. Двойная сумма s(x)

s7 = double_sum(0.5, 4, 3);
fprintf('7. s(x) = %.6f\n', s7);

% 8. w = sum_i prod_j a_ij
M8 = [1 2 3; 4 5 6; 2 1 3];
w8 = sum_row_prod(M8);
fprintf('8. w = %g\n', w8);

% 9. Максимальное n, чтобы сумма <= 100
[n9, sum9] = max_n_for_sum(0.5, 100);
fprintf('9. n = %d, сумма = %.4f\n', n9, sum9);

% 10. Сумма ряда exp(x) с точностью eps
x10 = linspace(0, 5, 50);
s10 = exp_series(x10, 1e-6);
figure;
plot(x10, s10, 'b-', 'LineWidth', 1.5); hold on;
plot(x10, exp(x10), 'r--', 'LineWidth', 1.5);
grid on; title('10. s(x) и e^x'); xlabel('x'); ylabel('y'); legend('s(x)', 'e^x');

% 11. Окружности и точка
x_c = [2 5 8 4 7]; y_c = [3 6 2 5 1]; r = [1.5 2.0 1.0 1.8 1.2];
point = [5, 3.5];
plot_circles_and_point(x_c, y_c, r, point);

% Файл-функции

function p = prod_le_mean(v)
    p = prod(v(v <= mean(v)));
end

function [n0, n1] = count_zeros_ones(M)
    n0 = sum(M(:) == 0);
    n1 = sum(M(:) == 1);
end

function c = pos_between_max_min(v)
    [~, imax] = max(v);
    [~, imin] = min(v);
    a = min(imax, imin);
    b = max(imax, imin);
    c = sum(v(a+1:b-1) > 0);
end

function s = sum_neg_below_diag(M)
    n = size(M, 1);
    mask = tril(true(n), -1);
    s = sum(M(mask & M < 0));
end

function v = replace_pos_with_sum_neg(v)
    s = sum(v(v < 0));
    v(v > 0) = s;
end

function A = fill_matrix(n)
    A = zeros(n);
    for i = 1:n
        for j = 1:n
            if i > j
                A(i,j) = i - j;
            elseif i == j
                A(i,j) = i + j;
            else
                A(i,j) = i^2 + j^2;
            end
        end
    end
end

function s = double_sum(x, n, m)
    [I, J] = meshgrid(1:n, 1:m);
    s = sum(sum(x.^(I+J) ./ (I+J).^2));
end

function w = sum_row_prod(A)
    w = sum(prod(A, 2));
end

function [n, s] = max_n_for_sum(x, limit)
    n = 0; s = 0; max_iter = 1000;
    if x >= 1
        n = 0; s = 0;
        return;
    end
    while n < max_iter
        next_term = (n+1) * x^(n+1);
        if s + next_term > limit
            break;
        end
        n = n + 1;
        s = s + n*x^n;
    end
end

function s = exp_series(x, eps)
    s = zeros(size(x));
    for ix = 1:length(x)
        term = 1; s_val = term; k = 0;
        while abs(term / s_val) > eps
            k = k + 1;
            term = term * x(ix) / k;
            s_val = s_val + term;
        end
        s(ix) = s_val;
    end
end

function plot_circles_and_point(xc, yc, r, point)
    figure; hold on; axis equal; grid on;
    theta = linspace(0, 2*pi, 100);
    for k = 1:length(xc)
        d = sqrt((point(1)-xc(k))^2 + (point(2)-yc(k))^2);
        if d <= r(k)
            plot(xc(k)+r(k)*cos(theta), yc(k)+r(k)*sin(theta), 'b-');
        else
            plot(xc(k)+r(k)*cos(theta), yc(k)+r(k)*sin(theta), 'r-');
        end
    end
    plot(point(1), point(2), 'k.', 'MarkerSize', 20);
    title('11. Окружности и точка');
    xlabel('x'); ylabel('y');
end