% Author: Vishwas K Singh
% Email: vishwasks32@gmail.com
% Script to perform image compression using haar wavelet

% Clear screen and variables
clear all;
close all;
clc;

% Read the image
X = imread('lena.jpg');
img_size = size(X);
no_cols = img_size(1);

% Perform single-level decomposition of X using haar.
[cA1,cH1,cV1,cD1] = dwt2(X,'haar');

% Images coding.
cod_cA1 = wcodemat(cA1,no_cols);
cod_cH1 = wcodemat(cH1,no_cols);
cod_cV1 = wcodemat(cV1,no_cols);
cod_cD1 = wcodemat(cD1,no_cols);

% Show Approximation and Detail
figure(1)
subplot(2,2,1);
imshow(uint8(cod_cA1));
title('Approximation A1')
subplot(2,2,2);
imshow(uint8(cod_cH1));
title('Horizontal Detail H1');
subplot(2,2,3);
imshow(uint8(cod_cV1));
title('Vertical Detail V1');
subplot(2,2,4);
imshow(uint8(cod_cD1));
title('Diagonal Detail D1');

% Display Original Image
figure(2)
subplot(2,1,1);
imshow(uint8(X));
title('Input Image');

% Display 1-level Reconstructed image
subplot(2,1,2);
rec_X = idwt2(cA1,cH1,cV1,cD1,'haar');
imshow(uint8(rec_X));
title('1-level Reconstructed Image');


% Perform 2-level decomposition of X using haar.
[C, S] = wavedec2(X,2,'haar');

% Images coding.
A1 = wrcoef2('a',C,S,'haar',1);
A2 = wrcoef2('a',C,S,'haar',2);
H1 = wrcoef2('h',C,S,'haar',1);
H2 = wrcoef2('h',C,S,'haar',2);
D1 = wrcoef2('d',C,S,'haar',1);
D2 = wrcoef2('d',C,S,'haar',2);
V1 = wrcoef2('v',C,S,'haar',1);
V2 = wrcoef2('v',C,S,'haar',2);

rec_X1 = waverec2(C,S,'haar');

% Show Approxiamtion and Detail
figure(3)
subplot(2,4,1);
imshow(uint8(wcodemat(A1,no_cols)));
title('Approximation A1')
subplot(2,4,2);
imshow(uint8(wcodemat(H1,no_cols)));
title('Horizontal Detail H1');
subplot(2,4,3);
imshow(uint8(wcodemat(V1,no_cols)));
title('Vertical Detail V1');
subplot(2,4,4);
imshow(uint8(wcodemat(D1,no_cols)));
title('Diagonal Detail D1');

subplot(2,4,5);
imshow(uint8(wcodemat(A2,no_cols)));
title('Approximation A2')
subplot(2,4,6);
imshow(uint8(wcodemat(H2,no_cols)));
title('Horizontal Detail H2');
subplot(2,4,7);
imshow(uint8(wcodemat(V2,no_cols)));
title('Vertical Detail V2');
subplot(2,4,8);
imshow(uint8(wcodemat(D2,no_cols)));
title('Diagonal Detail D2')

% Show Original and 2-level Reconstructed image
figure(4);
subplot(2,1,1);
imshow(uint8(X));
title('Input Image');

subplot(2,1,2);
imshow(uint8(rec_X1));
title('2-level reconstructed image');