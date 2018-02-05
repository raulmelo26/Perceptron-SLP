function [Y] = funcDegrau(Y)
        [x,y] = size(Y);
        % POSI��O DO MAIOR ELEMENTO NO VETOR
        [~, i] = max(Y);
        % ZERA OS OUTROS VALORES
        Y = zeros(x, y);
        % COLOCA 1 NA POSI��O DO MAIOR
        Y(i) = 1;
end