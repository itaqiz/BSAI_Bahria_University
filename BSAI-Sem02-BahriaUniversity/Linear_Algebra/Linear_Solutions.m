% Topic: Solution of system of linear equations via MATLAB
% Submitted by: Muhammad Taqui 01-136221-021
% Subject: Linear Algebra BSAI - 2A

% Question 1: Solve the system of linear equations and plot the solution.
% System:
% 4x + y - 2z = 1
% 5x - 2y + z = 10
% 3x + 7y - z = 2

clc;        % Clear command window
clear;      % Clear workspace variables
close all;  % Close all open figures

% 1. Define the coefficient matrix A
A = [4,  1, -2;   % Row 1: Coefficients of x, y, z (Equation 1)
     5, -2,  1;   % Row 2: Coefficients of x, y, z (Equation 2)
     3,  7, -1];  % Row 3: Coefficients of x, y, z (Equation 3)

% 2. Define the constant vector B
B = [1;     % Equation 1 constant
     10;    % Equation 2 constant
     2];    % Equation 3 constant

% 3. Solve the system using A\B (recommended for stability)
X = A\B;

% Extract solutions
x_sol = X(1);
y_sol = X(2);
z_sol = X(3);

% Display the solution
fprintf('Solution:\n');
fprintf('x = %.4f\n', x_sol);
fprintf('y = %.4f\n', y_sol);
fprintf('z = %.4f\n\n', z_sol);

% 4. Plot the planes and solution point
[x_plane, y_plane] = meshgrid(-5:0.5:5); % Grid for x and y

% Equation 1: z = (4x + y - 1)/2
z1 = (4*x_plane + y_plane - 1)/2;

% Equation 2: z = 10 - 5x + 2y
z2 = 10 - 5*x_plane + 2*y_plane;

% Equation 3: z = 3x + 7y - 2
z3 = 3*x_plane + 7*y_plane - 2;

% Create figure
figure;
hold on;

% Plot the three planes with transparency
surf(x_plane, y_plane, z1, 'FaceColor', 'blue', 'FaceAlpha', 0.5, 'DisplayName', '4x + y - 2z = 1');
surf(x_plane, y_plane, z2, 'FaceColor', 'green', 'FaceAlpha', 0.5, 'DisplayName', '5x - 2y + z = 10');
surf(x_plane, y_plane, z3, 'FaceColor', 'magenta', 'FaceAlpha', 0.5, 'DisplayName', '3x + 7y - z = 2');

% Plot the solution point (intersection)
plot3(x_sol, y_sol, z_sol, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'red', 'DisplayName', 'Solution');

% Add labels and title
xlabel('x');
ylabel('y');
zlabel('z');
title('System of Linear Equations: Planes and Solution');
legend('Location', 'best');
grid on;
view(3); % 3D view
hold off;