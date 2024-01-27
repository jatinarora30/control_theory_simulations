pkg load control;

clc;
clear all;
k = 3;
m = 10;
b = 2;
A = [0, 1; -k/m, -b/m];
B = [0; 1/m];
C = [1, 0];
D = 0;

% Define simulation parameters
T = 5;        % Total simulation time
N = 1000;     % Number of points in the time vector
f = 1;        % Frequency of the sinusoidal input

% Define the time vector
t = linspace(0, T, N);

% Create the state-space system
sys = ss(A, B, C, D);

% Generate a sinusoidal input signal
u = sin(2*pi*f*t);

y = lsim(sys, u, t);

% Plot the system response
plot(t, y);
title('System Response to Sinusoidal Input');
xlabel('Time');
ylabel('Output');
grid on;
