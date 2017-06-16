% Author: Vishwas K Singh
% Email: vishwasks32@gmail.com
% Script to perform image denoising

% Clear the screen and variables
close all;
clear all;
clc;

% Input original image
X = imread('lena.jpg');
figure(1);
imshow(X);
title('Original Image');

% Noisy image
init = 2055615866; 
randn('state',init);
x = X + 50*uint8(randn(size(X)));
figure(2);
imshow(x);
title('Noisy Image');

% generate thresholds
[thr,sorh,keepapp] = ddencmp('den','wv',x);

%De-noise image using global thresholding option.
xd = wdencmp('gbl',x,'sym4',2,thr,sorh,keepapp);
figure(3);
imshow(xd);
title('Denoised Image');