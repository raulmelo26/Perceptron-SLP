function [ Y ] = binariza( Y, esc )
    if esc == 1
        
        [x,y] = size(Y);
        % POSIÇÃO DO MAIOR ELEMENTO NO VETOR
        [~, i] = max(Y);
        % ZERA OS OUTROS VALORES
        Y = zeros(x, y);
        % COLOCA 1 NA POSIÇÃO DO MAIOR
        Y(i) = 1;
    else
        [x,y] = size(Y);
        [~, i] = max(Y);
        Y = ones(x, y)*-1;
        Y(i) = 1;

end
