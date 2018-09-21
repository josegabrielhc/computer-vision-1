% Universide de Brasília - Pós Graduação em Sistemas Mecatrônicos
% Visão Computacional - Prof. José Maurício S. T. Motta
%
% José Gabriel Hermes Cavalcanti - 18/0154761
% 
% Utilizar o algoritmo Canny em diversas imagens
% Implemental os detectores de Robert e Sobel e comparar os algoritmos
clear all; close all;
%img1 = imresize(im2double(rgb2gray(imread('input/building2-1.png'))),0.25);
img1 = imresize(im2double(rgb2gray(imread('input/manual00.jpg'))),0.1);
%img3 = imread();
% Algoritmo de Robert (em Anexo)
% Algoritmo de Sobel (em Anexo)
% Aplicando o algoritmo Canny
canny = icanny(img1)>0;
sobel = Sobel(img1,0.5);
robert = Robert(img1,0.025);
figure;
subplot(1,3,1),imshow(canny);
subplot(1,3,2),imshow(sobel);
subplot(1,3,3),imshow(robert);
imwrite(imcrop(canny,[0 150 180 300]),'output/ex03_canny.png');
imwrite(imcrop(sobel,[0 150 180 300]),'output/ex03_sobel.png');
imwrite(imcrop(robert,[0 150 180 300]),'output/ex03_robert.png');
c = icanny(img1,1,0.1,0.5)>0;
imwrite(c,'output\ex03_canny,1,0.1,0.5.png')
c = icanny(img1,1,0.1,1.0)>0;
imwrite(c,'output\ex03_canny,1,0.1,1.0.png')
c = icanny(img1,1,0.25,0.5)>0;
imwrite(c,'output\ex03_canny,1,0.25,0.5.png')
c = icanny(img1,1,0.5,0.5)>0;
imwrite(c,'output\ex03_canny,1,0.5,0.5.png')
c = icanny(img1,0.5,0.1,0.5)>0;
imwrite(c,'output\ex03_canny,0.5,0.1,0.5.png')
c = icanny(img1,2.0,0.1,0.5)>0;
imwrite(c,'output\ex03_canny,2.0,0.1,0.5.png')
c = icanny(imresize(img1,0.25))>0;
imwrite(imresize(c,4),'output\ex03_resize0.25.png')
c = icanny(imresize(img1,0.50))>0;
imwrite(imresize(c,2),'output\ex03_resize0.50.png')
c = icanny(imresize(img1,0.75))>0;
imwrite(imresize(c,4/3),'output\ex03_resize0.75.png')
c = icanny(img1)>0;
imwrite(c,'output\ex03_resize1.0.png')