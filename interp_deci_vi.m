% Author : Vishwas K Singh
% E-mail : vishwasks32@gmail.com
% Description : Script to perform interpolation and decimation

% Prepare by clearing the screen
clc;clear all;close all;

% Generate a cosine signal
n = 1:1000;
x = cos(0.4*pi*n);
x1 = x(1:20);

% Plot the cosine signal
figure;
stem(x1);
xlabel('Samples');
ylabel('Amplitude');
title('first 20 samples of input sequence');

% Spectrum of given signal
[xz, w] = freqz(x,1,512);
figure;
plot(w/pi, abs(xz));
grid on;
xlabel('Samples');
ylabel('Amplitude');
title('spectrum input sequence');

% Generation of down sampled signal
y = downsample(x,2);
y1 = y(1:20);
figure;
stem(y1);
xlabel('Samples');
ylabel('Amplitude');
title('down sampled sequence');

% Generation of down sampled spectrum
[yz,w] = freqz(y,1,512);
figure;
plot(w/pi,abs(yz));
grid on;
xlabel('Samples');
ylabel('Amplitude');
title('spectrum of down sampled sequence');

% Generation of interpolated sequence
re_xdown = interp(y,2);
re_xdown1 = re_xdown(1:20);
figure;
stem(re_xdown1);
xlabel('Samples');
ylabel('Amplitude');
title('Interpolated sequence');

% Generation of interpolated spectrum
[re_z,w] = freqz(re_xdown,1,512);
figure;
plot(w/pi, abs(re_z));
grid on;
xlabel('Samples');
ylabel('Amplitude');
title('spectrum of interpolated sequence');
