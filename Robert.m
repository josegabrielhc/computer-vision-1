function B = Robert(img,tau)
    % Aplicar filtro Gaussiano
    im = imgaussfilt(img);
    % Filtrar imagem
    I1 = imfilter(im,[1,-1;-1,1]);
    I2 = imfilter(im,[-1,1;1,-1]);
    % Estimar magnitude do gradiente de cada pixel.
    G = sqrt(I1.^2 + I2.^2);
    % Marcar pontos de borda se o gradiente for maior que tau.
    B = G > tau;
end