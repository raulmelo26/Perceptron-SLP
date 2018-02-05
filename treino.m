function [W, W1] = treino( X_treino, Y_treino, taxa_ap, epocas, n_atributos, n_neuronios, esc)
    % ADICIONA -1
    X_treino = [-1*ones(size(X_treino,1),1) X_treino]; 
    n_atributos = n_atributos + 1;
    % QUANTIDADE DE PADRÕES
    n_padroes = size(X_treino, 1);
    % MATRIZ DE PESOS ALEATÓRIOS
    W = rand(n_neuronios, size(X_treino, 2));
%     W1 = rand(n_neuronios, size(X_treino, 2));
%   W3 = rand(n_neuronios, size(X_treino, 2));
    m = size(X_treino,1);
    
   size(Y_treino);
    
    for j = 1 : epocas
        
        % EMBARALHA OS DADOS
        if n_atributos == 3
            dadosTreino = [X_treino Y_treino];
            dados = dadosTreino(randperm(m),:);
            X_treino = dados(:,1:3);
            Y_treino = dados(:,4:6);
        else
            dadosTreino = [X_treino Y_treino];
            dados = dadosTreino(randperm(m),:);
            X_treino = dados(:,1:5);
            Y_treino = dados(:,6:8);
        end
        
        for k = 1 : n_padroes
%             % COMPUTA A SAIDA USANDO A FUNÇÃO LOGÍSTICA
%             Y = logsig(W * X_treino(k,:)');
%             % COMPUTA A SAIDA USANDO A FUNÇÃO TANGENTE HIPER.
% %            Y1 = tanh(W1 * X_treino(k,:)');
% 
%             % CALCULA O ERRO PARA OS 3 PERCEPTRONS
%             Y = logsig(W * X_treino(k,:)');
% %             err1 = Y_treino(k,:) - Y1';
% 
%             % ATUALIZA OS VETORES W's
%             W = W + (taxa_ap * err' * Y'*(1-Y)*X_treino(k,:));
% %           W1 = W1 + (taxa_ap * err1'*0.5*[(1-Y')*(1-Y)]*X_treino(k,:));
                if esc == 1
                    Y = logsig(W * X_treino(k,:)');
                    err = Y_treino(k,:) - Y';
                    W = W + (taxa_ap * err' * Y'*(1-Y)*X_treino(k,:));                    
                    
                else
                   Y = tanh(W * X_treino(k,:)'); 
                   err = Y_treino(k,:) - Y';
                   W = W + (taxa_ap * err'*0.5*[(1-Y')*(1-Y)]*X_treino(k,:));
                end
        end

    end

end