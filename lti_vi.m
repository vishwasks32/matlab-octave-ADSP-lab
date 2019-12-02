% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to verify linear time invariant system

% Prepare by clearing the screen
clc;clear all;close all;

% inputs output of system y[n], for input x[n], N the number of samples
b = input('Enter the co-efficents of y[n]: '); % [1 1 0 1]
a = input('Enter the co-efficients of x[n]: '); % [1 2 3 4]
N = input('Enter the value of N: ');
n = 0 : N-1;

% Get the impulse response of the system and plot it
y = dimpulse(b,a,length(n));
subplot(2,2,1);
stem(y);
title('IMPULSE RESPONSE');
xlabel('n');
ylabel('Amplitude');

% Get the step response of the system and plot it
h = dstep(b,a,length(n));
subplot(2,2,2);
stem(h);
title('UNIT STEP RESPONSE');
xlabel('n');
ylabel('Amplitude');

% An exponential signal and its plot
x = 2 * exp(j * 0.2 * pi * n);
subplot(2,2,3);
stem(x);
title('EXPONENTIAL SIGNAL');
xlabel('n');
ylabel('Amplitude');

% Response of the system to an exponential signal and its plot
z = conv(x,h);
subplot(2,2,4);
stem(z);
title('OUTPUT');
xlabel('n');
ylabel('Amplitude');
