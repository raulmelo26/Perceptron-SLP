function [count] = teste( X_teste, Y_teste, W, esc)
    count = 0;
%     count1 = 0;
    n_neurons = size(Y_teste, 2);
    n_patterns = size(X_teste, 1);
    % ADICIONA -1
    X_teste = [-1*ones(size(X_teste,1),1) X_teste]; 
    % INICIA MATRIZ RESULTADOS
    Y = zeros(n_neurons, n_patterns);
%     Y1 = zeros(n_neurons, n_patterns);
    for i = 1 : n_patterns
        if esc == 1
            Y(:,i) = logsig(W * X_teste(i,:)');
            Y(:,i) = binariza(Y(:,i),esc);
            count = count + isequal(Y(:,i)', Y_teste(i,:));
        else
            Y(:,i) = tanh(W * X_teste(i,:)');
            Y(:,i) = binariza(Y(:,i),esc);
            count = count + isequal(Y(:,i)', Y_teste(i,:));
            
        end
%         % COMPUTA A SAIDA USANDO A FUNÇÃO LOGÍSTICA
%         Y(:,i) = logsig(W * X_teste(i,:)');
%         
%         % COMPUTA A SAIDA USANDO A FUNÇÃO TANGH
%         Y1(:,i) = tanh(W1 * X_teste(i,:)');
%         
%         % BINARIZA O VETOR, MAIOR FICA 1 E O RESTO 0
%         Y(:,i) = binariza(Y(:,i));
%         
%         % BINARIZA O VETOR, MAIOR FICA 1 E O RESTO 0
%         Y1(:,i) = binariza(Y1(:,i));
%         
%         % CONTA OS ACERTOS LOGÍSTICA
%         count = count + isequal(Y(:,i)', Y_teste(i,:));
%         % CONTA OS ACERTOS TANH
%         count1 = count1 + isequal(Y1(:,i)', Y_teste(i,:));

    end

end
