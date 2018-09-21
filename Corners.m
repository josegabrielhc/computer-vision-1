function L = Corners(X,N,tau)
    % Computar gradiente da imagem
    [Gx, Gy] = imgradientxy(X);
    L = [];
    for i = (N+1):(size(X,1)-N)
        for j = (N+1):(size(X,2)-N)
            % Forme matriz C sobre a vizinhan�a de p
            Ex = Gx(i-N:i+N,j-N:j+N);Ey = Gy(i-N:i+N,j-N:j+N);
            C = [sum(sum(Ex^2)),sum(sum(Ex*Ey));...
                sum(sum(Ex*Ey)),sum(sum(Ey^2))];
            % Compute lambda2, o menor autovalor de C
            lambda2 = min(eig(C));
            % Se lambda2 > tau, salve as coordenadas de p dentro de L
            if lambda2>tau
                L = [L;[lambda2,i,j,0]];
            end
        end
    end
    % Classifique L em ordem decrescente de lambda2
    L = sortrows(L,-1);
    % Varredura do topo a base eliminando pontos na vizinhan�a de p
    for i = 1:(size(L,1)-1)
        % Pula elementos j� detectados como sobrepostos
        if L(i,4) == 1
            continue
        end
        for j = i+1:size(L,1)
            ea = L(i,:);eb = L(j,:);
            % Determina se h� sobreposi��o por meio de fun��o de �rea.
            if rectint([ea(2)-N,ea(3)-N,(2*N+1),(2*N+1)],...
                       [eb(2)-N,eb(3)-N,(2*N+1),(2*N+1)]) ~= 0
                   L(j,4) = 1;
            end
        end
    end
    % Seleciona somente os valores n�o sobrepostos.
    L = L(L(:,4)==0,2:3);