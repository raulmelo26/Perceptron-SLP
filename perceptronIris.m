clc; clear;

fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                           REDES NEURAIS ARTIFICIAIS                    |\n');
fprintf('|                            PERCEPTRON DE UMA CAMADA                    |\n');
fprintf('|                         (Prof. Ajalmar Rego da Rocha Neto)             |\n');
fprintf('|                     Acadêmico: Raul Gabriel Carvalho de Melo           |\n');
fprintf('|                                IFCE - Maracanaú                        |\n');
fprintf('+------------------------------------------------------------------------+\n');

% CARREGA OS DADOS
reply = input('[1] LOGÍSTICA [2] TANGENTE HIPERBÓLICA\n');
       if reply == 1
          dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dataIris.dat');
       else
            dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dataIristanh.dat');
       end
       
% dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dataIris.dat');

% NORMALIZA OS DADOS
dados = [normaliza(dados(:,1:4)) dados(:,5:7)];


%% VARIÁVEIS INICIAIS
% NÚMERO DE REALIZAÇÕES, TAXA DE APRENDIZAGEM E NÚMERO DE ÉPOCAS
realizacoes = 20;
eta = 0.1;
n_epocas = 350;

n_neurons = 3;
n_atributos = 4;
m = size(dados,1);

%%
for i = 1 : realizacoes
    % EMBARALHA OS DADOS
    dados = dados(randperm(m),:);
    
    [dadosTreino,dadosTeste] = separaDados(dados,0.8);
    X_treino = dadosTreino(:,1:4);
    Y_treino = dadosTreino(:,5:7);
    X_teste  = dadosTeste(:,1:4);
    Y_teste  = dadosTeste(:,5:7);

    % TREINA A REDE COM QUANTIDADE X DE ÉPOCAS
    [W] = treino(X_treino, Y_treino, eta, n_epocas, n_atributos, n_neurons,reply);
%     % TESTE DA REDE, LOGÍSTICA/TANH
    [acertos] = teste(X_teste, Y_teste, W, reply);
%   
%     % PERCENTUAL DE ACERTOS DE CADA REALIZAÇÃO 
     perc = (acertos * 100) / size(X_teste, 1);
%     
%     % PERCENTUAL DE ACERTOS DE CADA REALIZAÇÃO PARA FUNÇÃO TANGENTE
%     % HIPERBÓLICA
%     perc1 = (acertos1 * 100) / size(X_teste, 1);
%     % ARMAZENA EM UM VETOR DE ACERTOS
     vetor_acertos(i) = perc;
%     vetor_acertos1(i) = perc1;

end


% RESULTADOS PARA LOGÍSTICA
% disp('Função LOGÍSTICA');
fprintf('\n\tNúmero de realizações: %i\n', realizacoes);
fprintf('\tAcurácia média: %.2f\n', mean(vetor_acertos));
fprintf('\tMenor acurácia: %.2f\n', min(vetor_acertos));
fprintf('\tMaior acurácia: %.2f\n', max(vetor_acertos));
fprintf('\tDesvio padrão: %.2f\n\n', std(vetor_acertos));
% 
% % RESULTADOS PARA TANGENTE HIPERBÓLICA
% disp('Função TANGENTE HIPERBÓLICA');
% fprintf('\n\tNúmero de realizações: %i\n', realizacoes);
% fprintf('\tAcurácia média: %.2f\n', mean(vetor_acertos1));
% fprintf('\tMenor acurácia: %.2f\n', min(vetor_acertos1));
% fprintf('\tMaior acurácia: %.2f\n', max(vetor_acertos1));
% fprintf('\tDesvio padrão: %.2f\n\n', std(vetor_acertos1));
