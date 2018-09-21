% Universide de Brasília - Pós Graduação em Sistemas Mecatrônicos
% Visão Computacional - Prof. José Maurício S. T. Motta
%
% José Gabriel Hermes Cavalcanti - 18/0154761
% 
% Escrever rotinas para inserção de ruído gaussiano e sal-e-pimenta
% Implementar filtros de ruídos Gaussiano e Mediano
% Aplicar sobre duas imagens


clear;
% le as imagens de entrada como double, em escala de cinza, redimensionada
img1 = imresize(im2double(rgb2gray(imread('input/manual00.jpg'))),0.05);
% gaussiano
S = 0.05; M = 0;
gn = img1 + normrnd(M,S,size(img1));

% sal-e-pimenta
imax = 1; imin = 0; epsilon = 0.95;
x = rand(size(img1)); y = rand(size(img1));sp = img1;
temp = find(x>epsilon);
sp(temp) = imin + y(temp)*(imax-imin);

% filtro de ruído Gaussiano
% como a maior referência no stackoverflow para a implementacao do kernel
% e a propria funcao do matlab (https://bit.ly/2O0bgKI), utilizo a mesma. 
size = 3; sigma = 1;
gfilter3 = fspecial('gaussian',[size,size], sigma);
size = 5; sigma = 1;
gfilter5 = fspecial('gaussian',[size,size], sigma);
size = 7; sigma = 1;
gfilter7 = fspecial('gaussian',[size,size], sigma);
size = 5; sigma = 1.5;
gfilter5a = fspecial('gaussian',[size,size], sigma);
size = 5; sigma = 2;
gfilter5b = fspecial('gaussian',[size,size], sigma);

% filtro de ruído Mediano
size = 3;
mfilter3 = ones(size)/size^2;
size = 5;
mfilter5 = ones(size)/size^2;
size = 7;
mfilter7 = ones(size)/size^2;

imwrite(gn,'output/ex02_gaussiano.png');
imwrite(sp,'output/ex02_sal.png');
imwrite(img1,'output/ex02_original.png');
imwrite(imfilter(sp,gfilter3),'output/ex02_sal_gaussiano3.png');
imwrite(imfilter(sp,mfilter3),'output/ex02_sal_media3.png');
imwrite(imfilter(gn,gfilter3),'output/ex02_gaussiano_gaussiano3.png');
imwrite(imfilter(gn,mfilter3),'output/ex02_gaussiano_media3.png');

imwrite(imfilter(sp,gfilter5),'output/ex02_sal_gaussiano5.png');
imwrite(imfilter(sp,mfilter5),'output/ex02_sal_media5.png');
imwrite(imfilter(gn,gfilter5),'output/ex02_gaussiano_gaussiano5.png');
imwrite(imfilter(gn,mfilter5),'output/ex02_gaussiano_media5.png');

imwrite(imfilter(sp,gfilter5),'output/ex02_sal_gaussiano7.png');
imwrite(imfilter(sp,mfilter5),'output/ex02_sal_media7.png');
imwrite(imfilter(gn,gfilter5),'output/ex02_gaussiano_gaussiano7.png');
imwrite(imfilter(gn,mfilter5),'output/ex02_gaussiano_media7.png');

imwrite(imfilter(sp,gfilter5a),'output/ex02_sal_gaussiano5a.png');
imwrite(imfilter(gn,gfilter5a),'output/ex02_gaussiano_gaussiano5a.png');

imwrite(imfilter(sp,gfilter5b),'output/ex02_sal_gaussiano5b.png');
imwrite(imfilter(gn,gfilter5b),'output/ex02_gaussiano_gaussiano5b.png');
