clc, clearvars, close all

N = 100;

k_values = [2,4,6];
xmax_values = [0.5, 1, 1.5];
J = get_J(k_values, xmax_values, N);

