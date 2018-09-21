% Universide de Brasília - Pós Graduação em Sistemas Mecatrônicos
% Visão Computacional - Prof. José Maurício S. T. Motta
%
% José Gabriel Hermes Cavalcanti - 18/0154761
% 
% Implementar algoritmo Corners
% Construir imagem sintética e testar o algoritmo
% Utilizar imagem 'building2-1.png'
% Utilizar funcao 'icorner' da toolbox Machine Vision
clear all; close all;
% Algoritmo Corners (em anexo)
% Gerar imagem de quadrado branco em fundo preto
img = zeros([750,750]);
img(326:425,326:425) = ones(100);
img = imresize(img,0.5);
imwrite(img,'output/ex04_square.png');
% Utilizando a função Corners implementada
L = Corners(img,2,1.5);
fig1 = figure;set(fig1,'Visible','off');
imshow(img);
% Desenhando os cantos encontrados
hold on
for i = 1:size(L,1)
    plot(L(i,1),L(i,2),'r*')
end
frame = getframe(fig1);frame = frame.cdata;
imwrite(frame,'output/ex04_a_corners.png');
% Utilizando a função icorner
fig2 = figure;
imshow(img);
M = icorner(img);
% Desenhando os cantos encontrados (alternativamente plot(M))
hold on
for i = 1:size(M,2)
    j = M(i).uv;
    plot(j(1),j(2),'b*')
end
frame = getframe(fig2);frame = frame.cdata;
imwrite(frame,'output/ex04_a_icorner.png');
% Mesmos procedimentos, com a imagem do prédio.
img = imread('building2-1.png');
% Utilizando a função Corners implementada
L = Corners(img,2,3e6);
fig3 = figure;
imshow(img);
% Desenhando os cantos encontrados
hold on
for i = 1:100
    plot(L(i,1),L(i,2),'r*')
end
frame = getframe(fig3);frame = frame.cdata;
imwrite(frame,'output/ex04_b_corners.png');
% Utilizando a função icorner
fig4 = figure;
imshow(img);
M = icorner(img);
% Desenhando os cantos encontrados (alternativamente plot(M))
hold on
for i = 1:size(M,2)
    j = M(i).uv;
    plot(j(1),j(2),'b*')
end
frame = getframe(fig4);frame = frame.cdata;
imwrite(frame,'output/ex04_b_icorner.png');

