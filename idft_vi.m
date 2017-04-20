% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to find IDFT of a sequence

% Prepare by clearing the screen
clc;clear all;close all;

% Take the input sequence
Xk = input('Enter the input sequence: '); % [1 2-5i -1 2+5i]
N = length(Xk);

% Initialize output sequence with zeros
xn = zeros(1,N);

% Compute DFT{x[n]} using formula
for n = 0:N-1
		for k = 0:N-1
				xn(n+1) = xn(n+1) + Xk(k+1) * exp((j*2*pi*n*k)/N);
		end
end

xn = xn/N;

% Display output sequence
disp('The IDFT x(n) for given sequence is: ');
disp(round(real(xn))); % [1 3 -1 -2]

n = 0:N-1;

% Plot the input sequence
subplot(3,1,1);
stem(n,abs(Xk));
xlabel('Samples');
ylabel('Amplitude');
title('INPUT SEQUENCE');

% Plot the magnitude of output
subplot(3,1,2);
stem(n,round(real(xn)));
xlabel('Samples');
ylabel('Amplitude');
title('MAGNITUDE');

% Plot the input sequence
subplot(3,1,3);
stem(n,angle(xn));
xlabel('Samples');
ylabel('Amplitude');
title('DEGREE');
