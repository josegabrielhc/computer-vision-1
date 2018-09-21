% Universide de Brasília - Pós Graduação em Sistemas Mecatrônicos
% Visão Computacional - Prof. José Maurício S. T. Motta
%
% José Gabriel Hermes Cavalcanti - 18/0154761
% 

clear all; close all;
% Abertura das fotografias.
i00 = imresize(im2double(rgb2gray(imread('input/manual00.jpg'))),0.25);
i01 = imresize(im2double(rgb2gray(imread('input/manual01.jpg'))),0.25);
i02 = imresize(im2double(rgb2gray(imread('input/manual02.jpg'))),0.25);
i03 = imresize(im2double(rgb2gray(imread('input/manual03.jpg'))),0.25);
i04 = imresize(im2double(rgb2gray(imread('input/manual04.jpg'))),0.25);
i05 = imresize(im2double(rgb2gray(imread('input/manual05.jpg'))),0.25);
i06 = imresize(im2double(rgb2gray(imread('input/manual06.jpg'))),0.25);
i07 = imresize(im2double(rgb2gray(imread('input/manual07.jpg'))),0.25);
i08 = imresize(im2double(rgb2gray(imread('input/manual08.jpg'))),0.25);
i09 = imresize(im2double(rgb2gray(imread('input/manual09.jpg'))),0.25);

% Calculando matrizes media e desvio padrao dos pixels.
mean = (i00 + i01 + i02 + i03 + i04 + i05 + i06 + i07 + i08 + i09)/10;
dp = sqrt(((i00-mean).^2 + (i01-mean).^2 + (i02-mean).^2 + ... 
    (i03-mean).^2 + (i04-mean).^2 + (i05-mean).^2 + (i06-mean).^2 + ...
    (i07-mean).^2 + (i08-mean).^2 + (i09-mean).^2)/9);
% Selecionando uma linha aproximadamente ao meio da imagem.
mean_line = mean(350,:);
dp_line = dp(350,:);
% Plotando valores de media e desvios padrao abaixo e acima da media.
fig = figure;
plot(1:length(mean_line),mean_line,1:length(dp_line),mean_line+dp_line, ...
    1:length(dp_line),mean_line-dp_line);
title('Estimativa de ruido');
xlabel('Posição do pixel')
ylabel('Intensidade de pixel')
legend('\mu','\mu + \sigma','\mu - \sigma','Location','northwest');
saveas(fig,'output/ex01_ruido.png');
% Variação de intensidade (compreendida como desvio padrão médio).
fprintf('Valor médio do Desvio Padrão: %2f%%\n', mean2(dp)*100);

% Matriz de covariancia
ic00 = imcrop(i00,[125,0,749,750]);
meanc = imcrop(mean,[125,0,749,750]);

dif = ic00 - meanc;
C = zeros(size(meanc));
c = 1/(750^2);
[x,y] = size(C);
diff = ic00 - meanc;
disp('covariance');
% Os valores de N_i e N_j não variam até N-i'-1 pois slide indexa i' a 0.
% for i_l = 1:x 
%     N_i = x-i_l;
%     for j_l = 1:y
%         N_j = y-j_l;
%         for i = 1:N_i
%             for j = 1:N_j
%                 C(i_l,j_l) = C(i_l,j_l) + diff(i,j)*diff(i+i_l,j+j_l);
%             end
%         end
%     end
% end
tic;
for i = 1:x 
    Ni = x-i;
    for j = 1:y
        Nj = y-j;
        C(i,j) = sum(sum(diff(1:Ni,1:Nj).*diff(1+i:Ni+i,1+j:Nj+j)));
    end
end
toc;
C = C./c;
fig2 = figure;
mesh(C)
saveas(fig2,'output/ex01_autocovariance.png');