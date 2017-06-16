% Author: Vishwas K Singh
% Email: vishwasks32@gmail.com
% Script to Generate DTMF signals

clear all;
close all;
clc;

% Let us assign keys for telephone keypad
k = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '*', '#'];

% Assign Frequencies low and high
low_freq = [697 770 852 941];
high_freq = [1209 1336 1447];

% Compute frequencies for each button
f = [];
for i = 1:4
    for j = 1:3
        f = [f [low_freq(i);high_freq(j)] ];
    end
end
disp(f);

% Generation and plotting 2 seconds tones
Fs = 8000; %Sampling Frequency 8kHz
N = 800;  %duration of Samples 8ms
t = (0:N-1)/Fs;

 for btn = 1:12
     %Get frequencies of tonechoice
     freq_both = f(:,btn);
    
     %Generate Sine waves
     lfb = sin(freq_both(1)*2*pi*t);
     hfb = sin(freq_both(2)*2*pi*t);
     
     % Get their sum
     tones = lfb+hfb;

     % Plot tone
     subplot(4,3,btn);
     plot(t,tones);
     hold on;
     title(['Symbol "', k(btn),'"']);
     ylabel('Amplitude');
     xlabel('Time (ms)');
 end