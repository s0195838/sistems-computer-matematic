
% ЕДИНЫЙ СКРИПТ ДЛЯ ВАРИАНТА 9 (ПОЛНОСТЬЮ ИСПРАВЛЕННЫЙ)
% Задания 1, 2, 3 (f1 и f2)
% =====================================================

clear; clc; close all;

%% ==================== ЗАДАНИЕ 1 ====================
disp('========== ЗАДАНИЕ 1 ==========');
disp('Операторы ветвления и цикла (матрицы)');

% Диалоговый ввод размера матрицы
n = input('Введите размер квадратной матрицы n: ');

% Генерация случайной матрицы A n x n
A = randi([-10, 10], n, n);
fprintf('\nИсходная матрица A (%dx%d):\n', n, n);
disp(A);

% Вычисление матрицы B
B = zeros(n, n);

for i = 1:n
    for j = 1:n
        if i < j
            B(i, j) = A(i, j) * sin(A(i, j));
        else
            B(i, j) = A(i, j) + sin(A(i, j));
        end
    end
end

fprintf('\nПолученная матрица B (%dx%d):\n', n, n);
disp(B);

% Формирование массивов из главной диагонали
A1 = diag(A)';
B1 = diag(B)';

fprintf('\nМассив A1 (главная диагональ A):\n');
disp(A1);
fprintf('Массив B1 (главная диагональ B):\n');
disp(B1);

% Объединение массивов и поиск минимума
all_elements = [A1, B1];
min_value = min(all_elements);
min_index_global = find(all_elements == min_value, 1);

% Определяем, откуда взят минимум
if min_index_global <= length(A1)
    source = 'A1';
    source_index = min_index_global;
else
    source = 'B1';
    source_index = min_index_global - length(A1);
end

fprintf('\nМинимальный элемент среди A1 и B1:\n');
fprintf('Значение: %.4f\n', min_value);
fprintf('Взят из: %s[%d]\n', source, source_index);

pause(1);

%% ==================== ЗАДАНИЕ 2 ====================
disp('========== ЗАДАНИЕ 2 ==========');
disp('Вывод графиков функций: sin^2(x), cos^2(x), x, ln^2(x)');

% Схема расположения для НЕЧЕТНОГО варианта (вариант 9):
% Окно 1 | Окно 3
%   Окно 2
% Окно 4

figure('Name', 'Графики функций (вариант 9)', 'Position', [100, 100, 1200, 800]);

% Для первых трех графиков используем x от 0 до 2π
x1 = linspace(0, 2*pi, 1000);

y1 = sin(x1).^2;  % sin^2(x)
y2 = cos(x1).^2;  % cos^2(x)
y3 = x1;           % x

% Для ln^2(x) нужен x > 0, возьмем от 0.1 до 2π
x4 = linspace(0.1, 2*pi, 1000);
y4 = log(x4).^2;   % ln^2(x)

% Окно 1 (верхнее левое) - sin^2(x)
subplot(2,2,1);
plot(x1, y1, 'r', 'LineWidth', 2);
grid on; 
title('y_1 = sin^2(x)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('x', 'FontSize', 11);
ylabel('y_1', 'FontSize', 11);
xlim([0, 2*pi]);
ylim([0, 1.2]);

% Окно 2 (нижнее левое) - cos^2(x)
subplot(2,2,3);
plot(x1, y2, 'g', 'LineWidth', 2);
grid on; 
title('y_2 = cos^2(x)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('x', 'FontSize', 11);
ylabel('y_2', 'FontSize', 11);
xlim([0, 2*pi]);
ylim([0, 1.2]);

% Окно 3 (верхнее правое) - x
subplot(2,2,2);
plot(x1, y3, 'b', 'LineWidth', 2);
grid on; 
title('y_3 = x', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('x', 'FontSize', 11);
ylabel('y_3', 'FontSize', 11);
xlim([0, 2*pi]);
ylim([0, 2*pi]);

% Окно 4 (нижнее правое) - ln^2(x)
subplot(2,2,4);
plot(x4, y4, 'm', 'LineWidth', 2);
grid on; 
title('y_4 = ln^2(x)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('x', 'FontSize', 11);
ylabel('y_4', 'FontSize', 11);
xlim([0, 2*pi]);
ylim([0, 5]);

% Общий заголовок
sgtitle('Графики функций (вариант 9)', 'FontSize', 14, 'FontWeight', 'bold');

fprintf('Графики выведены в отдельном окне\n');
fprintf('  - sin^2(x) - красный\n');
fprintf('  - cos^2(x) - зелёный\n');
fprintf('  - x - синий\n');
fprintf('  - ln^2(x) - пурпурный\n\n');

pause(1);

%% ==================== ЗАДАНИЕ 3 (f1) - ИСПРАВЛЕНО ====================
disp('========== ЗАДАНИЕ 3 (f1) ==========');
disp('Нахождение корней уравнения f(x) = x·sin(x) = 0');

figure('Name', 'Корни уравнения f(x)=x·sin(x)', 'Position', [150, 150, 800, 600]);

% Определяем функцию f(x) = x * sin(x)
f = @(x) x .* sin(x);

% Интервал поиска корней (можно расширить для демонстрации)
a = -4*pi;  % от -4π
b = 4*pi;   % до 4π

x_vals = linspace(a, b, 2000);
y_vals = f(x_vals);

% Построение графика
plot(x_vals, y_vals, 'b', 'LineWidth', 2);
hold on;
plot([a, b], [0, 0], 'k--', 'LineWidth', 1.5); % нулевая линия
grid on;
title('f(x) = x·sin(x)', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('x', 'FontSize', 12);
ylabel('f(x)', 'FontSize', 12);
xlim([a, b]);

% Аналитически корни: x = 0 или sin(x) = 0, т.е. x = π·k, k∈ℤ
% Найдем корни численно в заданном интервале
roots_list = [];

for k = ceil(a/pi):floor(b/pi)
    root = k * pi;
    if root >= a && root <= b
        roots_list = [roots_list, root];
        plot(root, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    end
end

% Также добавим корень x=0 (уже включен при k=0)
roots_list = unique(sort(roots_list));

% Вывод результатов
fprintf('Уравнение f(x) = x·sin(x) = 0\n');
fprintf('Аналитические корни: x = π·k, k ∈ Z\n');
fprintf('Найдены корни на интервале [%.1f, %.1f]:\n', a, b);
for i = 1:length(roots_list)
    fprintf('x%d = %.6f (π·%d)\n', i, roots_list(i), round(roots_list(i)/pi));
end
fprintf('Всего корней: %d\n\n', length(roots_list));

% Дополнительно: покажем, что в точках корней f(x)=0
fprintf('Проверка: f(x) в найденных корнях:\n');
for i = 1:min(length(roots_list), 10) % покажем первые 10
    fprintf('  f(%.4f) = %.2e\n', roots_list(i), f(roots_list(i)));
end
fprintf('\n');

legend('f(x) = x·sin(x)', 'f(x)=0', 'Корни', 'Location', 'best');
hold off;

pause(1);

%% ==================== ЗАДАНИЕ 3 (f2) - ИСПРАВЛЕНО ====================
disp('========== ЗАДАНИЕ 3 (f2) ==========');
disp('Нахождение минимума функции f(x1,x2) = |x1-2| + |x2-1|');

figure('Name', 'Минимум функции двух переменных', 'Position', [200, 200, 900, 700]);

% Определяем функцию f(x1,x2) = |x1-2| + |x2-1|
f2 = @(x1, x2) abs(x1 - 2) + abs(x2 - 1);

% Поиск минимума с помощью fminsearch
fmin_func = @(p) f2(p(1), p(2));
initial_guess = [0, 0];
[p_min, val_min] = fminsearch(fmin_func, initial_guess);

% Аналитический минимум: в точке (2, 1), значение = 0
exact_min_point = [2, 1];
exact_min_value = 0;

fprintf('Функция: f(x1,x2) = |x1-2| + |x2-1|\n');
fprintf('Аналитический минимум: в точке (2, 1), значение = 0\n');
fprintf('(так как модули неотрицательны и обращаются в ноль одновременно)\n\n');

% Создаем сетку для построения графика
[X1, X2] = meshgrid(0:0.1:4, -1:0.1:3);
Z = f2(X1, X2);

% Рисуем поверхность
surf(X1, X2, Z, 'EdgeColor', 'none', 'FaceAlpha', 0.8);
hold on;

% Отмечаем найденный минимум
plot3(p_min(1), p_min(2), val_min, 'ro', 'MarkerSize', 12, ...
      'MarkerFaceColor', 'r', 'LineWidth', 2);

% Отмечаем точный минимум
plot3(exact_min_point(1), exact_min_point(2), exact_min_value, ...
      'g*', 'MarkerSize', 15, 'LineWidth', 2);

% Настройка графика
xlabel('x_1', 'FontSize', 12);
ylabel('x_2', 'FontSize', 12);
zlabel('f(x_1, x_2)', 'FontSize', 12);
title('f(x_1, x_2) = |x_1-2| + |x_2-1|', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
colorbar;

% Легенда
legend('Поверхность f(x_1,x_2)', ...
       sprintf('Найденный минимум (%.4f, %.4f, %.4f)', p_min(1), p_min(2), val_min), ...
       sprintf('Точный минимум (2, 1, 0)'), ...
       'Location', 'best');

% Настройка обзора
view(45, 30);

% Вывод результатов
fprintf('Результаты численного поиска минимума:\n');
fprintf('  Найденная точка: (%.6f, %.6f)\n', p_min(1), p_min(2));
fprintf('  Значение функции: %.6f\n', val_min);
fprintf('\nПогрешность:\n');
fprintf('  По x1: %.2e\n', abs(p_min(1) - 2));
fprintf('  По x2: %.2e\n', abs(p_min(2) - 1));
fprintf('  По значению: %.2e\n\n', abs(val_min - 0));

%% ==================== ЗАВЕРШЕНИЕ ====================
disp('========================================');
disp('ВСЕ ЗАДАНИЯ ВЫПОЛНЕНЫ УСПЕШНО!');
disp('========================================');
disp('Открытые окна с графиками:');
disp('  - Окно 1: 4 графика функций (sin^2, cos^2, x, ln^2)');
disp('  - Окно 2: корни уравнения f(x)=x·sin(x)');
disp('  - Окно 3: минимум функции f(x1,x2)=|x1-2|+|x2-1|');
disp('========================================'); 