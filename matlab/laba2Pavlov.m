
clear; clc;

% ВЕКТОРЫ


% 1. Переставить элементы вектора в обратном порядке
v1 = [3 7 1 9 4 6 2 8];
v1_reversed = v1(end:-1:1);

% 2. Выделить элементы с четными номерами
v2 = [5 2 8 1 9 4 7 3 6];
v2_even = v2(2:2:end);

% 3. Найти сумму положительных элементов
v3 = [-3 5 -1 7 0 -2 4 -6 2];
sum_positive = sum(v3(v3 > 0));

% 4. Заменить элементы, отличающиеся от среднего геометрического >10%, на среднее геометрическое
v4 = [2 4 8 3 6 1 5 9 7];
geom_mean = prod(v4)^(1/length(v4));
v4_new = v4;
v4_new(abs(v4 - geom_mean) > 0.1 * geom_mean) = geom_mean;

% 5. Заменить все минимальные элементы максимальным значением
v5 = [3 5 1 7 1 9 1 4 6];
v5_new = v5;
v5_new(v5 == min(v5)) = max(v5);

% 6. Найти число положительных и отрицательных элементов
v6 = [-2 4 -6 0 3 -1 5 -8 2];
num_positive = sum(v6 > 0);
num_negative = sum(v6 < 0);

fprintf('1. Обратный: [%s]\n', num2str(v1_reversed));
fprintf('2. Четные:   [%s]\n', num2str(v2_even));
fprintf('3. Сумма >0: %g\n', sum_positive);
fprintf('4. Результат: [%s]\n', num2str(v4_new));
fprintf('5. Результат: [%s]\n', num2str(v5_new));
fprintf('6. Положит.: %d, Отрицат.: %d\n\n', num_positive, num_negative);

% МАТРИЦЫ

% 1. Нормы матрицы
A = [-1.2  4.6 -0.3;
      2.8  9.9 -0.7;
      0.9 -2.5  7.1];
n = size(A, 1);
p = max(sum(abs(A), 2));
q = max(sum(abs(A), 1));
s = sum(sum(abs(A)));

fprintf('1. n=%d, p=%.4f, q=%.4f, s=%.4f\n\n', n, p, q, s);

% 2. Формирование матриц

% 2.1
n1 = 7;
M1 = diag([2 3 4 5 6 -1 8]) + diag(ones(n1-1,1), 1) + diag(-ones(n1-1,1), -1);
M1(1, n1) = 5;
M1(n1, 1) = 5;

% 2.2
n2 = 7;
M2 = eye(n2);
M2(n2, n2) = 5;
M2 = M2 - fliplr(diag(ones(n2-1,1), 1));
M2(n2, 1) = -1;
M2(1, n2) = -1;

% 2.3
M3 = eye(7, 10);

% 2.4
M4 = eye(7, 10);
M4(:, 5:8) = M4(:, 5:8) + eye(7, 4);

fprintf('2.1:\n'); disp(M1);
fprintf('2.2:\n'); disp(M2);
fprintf('2.3:\n'); disp(M3);
fprintf('2.4:\n'); disp(M4);

% 3. Блочные матрицы и обработка

% A1
I3 = eye(3);
A1 = [I3, 4*I3; 2*ones(3), 3*ones(3)];

% A2
A2 = [ones(2), -3*ones(2,4); -3*ones(4,2), 2*eye(4)];

% r
r = sqrt(sum(A1.^2, 2));

% s
s_val = sum(diag(A2, -1));

% Перестановка столбцов A2 по возрастанию суммы элементов
[~, idx] = sort(sum(A2, 1));
A2_sorted = A2(:, idx);

% Сумма положительных A2
sum_pos_A2 = sum(A2(A2 > 0));

% Максимальные индексы отрицательных A1
[row_neg, col_neg] = find(A1 < 0);
max_row_neg = max(row_neg);
max_col_neg = max(col_neg);

fprintf('\n3. A1:\n'); disp(A1);
fprintf('r:\n'); disp(r);
fprintf('A2:\n'); disp(A2);
fprintf('s = %.4f\n', s_val);
fprintf('A2 sorted:\n'); disp(A2_sorted);
fprintf('sum_pos_A2 = %.4f\n', sum_pos_A2);
fprintf('max_row_neg = %d, max_col_neg = %d\n', max_row_neg, max_col_neg);