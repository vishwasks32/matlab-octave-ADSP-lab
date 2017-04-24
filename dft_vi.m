% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to find DFT of a sequence

% Prepare by clearing the screen
clc;clear all;close all;

% Take the input sequence
xn = input('Enter the input sequence: '); % [1 3 -1 -2]
N = length(xn);

% Initialize output sequence with zeros
Xk = zeros(1,N);

% Compute DFT{x[n]} using formula
for k = 0:N-1
		for n = 0:N-1
				Xk(k+1) = Xk(k+1) + xn(n+1) * exp((-j*2*pi*n*k)/N);
		end
end

% Display output sequence
disp('The DFT X(k) for given sequence is: ');
disp(Xk); % [1 2-5i -1 2+5i]

n = 0:N-1;

% Plot the input sequence
subplot(3,1,1);
stem(n,xn);
xlabel('Samples');
ylabel('Amplitude');
title('INPUT SEQUENCE');

% Plot the magnitude of output
subplot(3,1,2);
stem(n,abs(Xk));
xlabel('Samples');
ylabel('Amplitude');
title('MAGNITUDE');

% Plot the degree of output sequence
subplot(3,1,3);
stem(n,angle(Xk));
xlabel('Samples');
ylabel('Amplitude');
title('DEGREE');
