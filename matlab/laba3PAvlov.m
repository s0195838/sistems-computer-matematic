
clear; clc; close all;


% ЗАДАНИЕ 1. Графики функций одной переменной

x = linspace(0.01, 2*pi, 500);
f = sin(x) ./ x;
g = exp(-x) .* cos(x);

% Цвета для отрицательных/положительных значений f
idx_neg_f = find(f < 0);
idx_pos_f = find(f >= 0);
idx_neg_g = find(g < 0);
idx_pos_g = find(g >= 0);

% --- Отдельные окна ---
figure('Name', 'f(x) = sin(x)/x');
plot(x(idx_pos_f), f(idx_pos_f), 'r-', 'LineWidth', 1.5); hold on;
plot(x(idx_neg_f), f(idx_neg_f), 'b-', 'LineWidth', 1.5);
grid on;
title('f(x) = sin(x)/x');
xlabel('x'); ylabel('f(x)');
legend('f \geq 0', 'f < 0');

figure('Name', 'g(x) = e^{-x} cos(x)');
plot(x(idx_pos_g), g(idx_pos_g), 'r--', 'LineWidth', 1.5); hold on;
plot(x(idx_neg_g), g(idx_neg_g), 'b--', 'LineWidth', 1.5);
grid on;
title('g(x) = e^{-x} cos(x)');
xlabel('x'); ylabel('g(x)');
legend('g \geq 0', 'g < 0');

% Одно окно, одни оси 
figure('Name', 'Одни оси');
plot(x(idx_pos_f), f(idx_pos_f), 'r-', 'LineWidth', 1.5); hold on;
plot(x(idx_neg_f), f(idx_neg_f), 'b-', 'LineWidth', 1.5);
plot(x(idx_pos_g), g(idx_pos_g), 'm--', 'LineWidth', 1.5);
plot(x(idx_neg_g), g(idx_neg_g), 'c--', 'LineWidth', 1.5);
grid on;
title('f(x) и g(x) на одних осях');
xlabel('x'); ylabel('y');
legend('f \geq 0', 'f < 0', 'g \geq 0', 'g < 0');

%  Одно окно, отдельные оси 
figure('Name', 'Отдельные оси');
subplot(2,1,1);
plot(x(idx_pos_f), f(idx_pos_f), 'r-', 'LineWidth', 1.5); hold on;
plot(x(idx_neg_f), f(idx_neg_f), 'b-', 'LineWidth', 1.5);
grid on;
title('f(x) = sin(x)/x');
xlabel('x'); ylabel('f(x)');
legend('f \geq 0', 'f < 0');

subplot(2,1,2);
plot(x(idx_pos_g), g(idx_pos_g), 'm--', 'LineWidth', 1.5); hold on;
plot(x(idx_neg_g), g(idx_neg_g), 'c--', 'LineWidth', 1.5);
grid on;
title('g(x) = e^{-x} cos(x)');
xlabel('x'); ylabel('g(x)');
legend('g \geq 0', 'g < 0');

% ЗАДАНИЕ 2. Визуализация функции двух переменных

x2 = linspace(-1, 1, 100);
y2 = linspace(-1, 1, 100);
[X, Y] = meshgrid(x2, y2);
Z = (sin(X.^2) + cos(Y.^2)).^(X.*Y);

% Экстремумы
[Z_max, idx_max] = max(Z(:));
[row_max, col_max] = ind2sub(size(Z), idx_max);
[Z_min, idx_min] = min(Z(:));
[row_min, col_min] = ind2sub(size(Z), idx_min);

% Каркасная поверхность 
figure('Name', 'Каркасная');
mesh(X, Y, Z);
title('Каркасная поверхность');
xlabel('x'); ylabel('y'); zlabel('z');
hold on;
plot3(X(row_max, col_max), Y(row_max, col_max), Z_max, 'r.', 'MarkerSize', 20);
plot3(X(row_min, col_min), Y(row_min, col_min), Z_min, 'b.', 'MarkerSize', 20);
legend('', 'max', 'min');

% Залитая каркасная 
figure('Name', 'Залитая');
surf(X, Y, Z);
title('Залитая каркасная поверхность');
xlabel('x'); ylabel('y'); zlabel('z');
hold on;
plot3(X(row_max, col_max), Y(row_max, col_max), Z_max, 'r.', 'MarkerSize', 20);
plot3(X(row_min, col_min), Y(row_min, col_min), Z_min, 'b.', 'MarkerSize', 20);

% Линии уровня 
figure('Name', 'Линии уроня');
levels = [0.5 0.8 1.0 1.2 1.5];
contour(X, Y, Z, levels, 'ShowText', 'on');
title('Линии уровня');
xlabel('x'); ylabel('y');
colorbar;

% Освещенная поверхность 
figure('Name', 'Освещенная');
surfl(X, Y, Z);
shading interp;
colormap(gray);
title('Освещенная поверхность');
xlabel('x'); ylabel('y'); zlabel('z');
hold on;
plot3(X(row_max, col_max), Y(row_max, col_max), Z_max, 'r.', 'MarkerSize', 20);
plot3(X(row_min, col_min), Y(row_min, col_min), Z_min, 'b.', 'MarkerSize', 20);

% Обзор с нескольких точек
figure('Name', 'Обзор');
subplot(2,2,1); mesh(X, Y, Z); view(37.5, 30); title('Вид по умолчанию');
subplot(2,2,2); mesh(X, Y, Z); view(0, 90);  title('Вид сверху');
subplot(2,2,3); mesh(X, Y, Z); view(90, 0);  title('Вид сбоку');
subplot(2,2,4); mesh(X, Y, Z); view(-37.5, 60); title('Вид сзади');

%Все графики в одном окне
figure('Name', 'Все вместе');
subplot(2,2,1); mesh(X, Y, Z); title('Каркасная');
xlabel('x'); ylabel('y'); zlabel('z');
hold on; plot3(X(row_max, col_max), Y(row_max, col_max), Z_max, 'r.', 'MarkerSize', 15);

subplot(2,2,2); surf(X, Y, Z); title('Залитая');
xlabel('x'); ylabel('y'); zlabel('z');
hold on; plot3(X(row_max, col_max), Y(row_max, col_max), Z_max, 'r.', 'MarkerSize', 15);

subplot(2,2,3); contour(X, Y, Z, levels, 'ShowText', 'on'); title('Линии уровня');
xlabel('x'); ylabel('y');

subplot(2,2,4); surfl(X, Y, Z); shading interp; colormap(gray); title('Освещенная');
xlabel('x'); ylabel('y'); zlabel('z');
hold on; plot3(X(row_max, col_max), Y(row_max, col_max), Z_max, 'r.', 'MarkerSize', 15);

fprintf('Максимум: Z=%.4f при x=%.4f, y=%.4f\n', Z_max, X(row_max, col_max), Y(row_max, col_max));
fprintf('Минимум: Z=%.4f при x=%.4f, y=%.4f\n', Z_min, X(row_min, col_min), Y(row_min, col_min));

% ЗАДАНИЕ 3. Векторные поля градиента на поверхностях

%Гиперболоид
[Xh, Yh] = meshgrid(-2:0.5:2, -2:0.5:2);
Zh = Xh.^2 - Yh.^2;
[Nx, Ny, Nz] = surfnorm(Xh, Yh, Zh);

figure('Name', 'Гиперболоид — отражение (паралл.)');
quiver3(Xh, Yh, Zh, Nx, Ny, Nz, 0.5); hold on;
surf(Xh, Yh, Zh, 'FaceAlpha', 0.3);
title('Отражение, параллельный пучок (гиперболоид)');

%  Параболоид
[Xp, Yp] = meshgrid(-2:0.5:2, -2:0.5:2);
Zp = Xp.^2 + Yp.^2;
[Nx, Ny, Nz] = surfnorm(Xp, Yp, Zp);

figure('Name', 'Параболоид — отражение (паралл.)');
quiver3(Xp, Yp, Zp, Nx, Ny, Nz, 0.5); hold on;
surf(Xp, Yp, Zp, 'FaceAlpha', 0.3);
title('Отражение, параллельный пучок (параболоид)');

% Параметрическая поверхность 
u = linspace(0, 3, 20);
v = linspace(0, 3, 20);
[U, V] = meshgrid(u, v);
Xpar = cos(U).*cos(V);
Ypar = sin(U).*sin(V);
Zpar = U.*V;
[Nx, Ny, Nz] = surfnorm(Xpar, Ypar, Zpar);

% Отраженный свет (параллельный пучок)
figure('Name', 'Параметрическая — отражение (паралл.)');
quiver3(Xpar, Ypar, Zpar, Nx, Ny, Nz, 0.3); hold on;
surf(Xpar, Ypar, Zpar, 'FaceAlpha', 0.3);
title('Отражение, параллельный пучок (параметрическая)');

% Преломленный свет (параллельный пучок)
V_in = [0; 0; -1];
V_refr = V_in - 2 * (V_in' * [Nx(:)'; Ny(:)'; Nz(:)']) .* [Nx(:)'; Ny(:)'; Nz(:)'];
figure('Name', 'Параметрическая — преломление (паралл.)');
quiver3(Xpar(:), Ypar(:), Zpar(:), V_refr(1,:)', V_refr(2,:)', V_refr(3,:)', 0.3); hold on;
surf(Xpar, Ypar, Zpar, 'FaceAlpha', 0.3);
title('Преломление, параллельный пучок (параметрическая)');

% Отраженный свет (точечный источник)
source = [2; 2; 5];
L = source - [Xpar(:)'; Ypar(:)'; Zpar(:)'];
L = L ./ vecnorm(L);
R = 2 * sum([Nx(:)'; Ny(:)'; Nz(:)'] .* L) .* [Nx(:)'; Ny(:)'; Nz(:)'] - L;
figure('Name', 'Параметрическая — отражение (точечный)');
quiver3(Xpar(:), Ypar(:), Zpar(:), R(1,:)', R(2,:)', R(3,:)', 0.3); hold on;
surf(Xpar, Ypar, Zpar, 'FaceAlpha', 0.3);
title('Отражение, точечный источник (параметрическая)'); 