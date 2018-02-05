clc; clear;

fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                           REDES NEURAIS ARTIFICIAIS                    |\n');
fprintf('|                            PERCEPTRON DE UMA CAMADA                    |\n');
fprintf('|                         (Prof. Ajalmar Rego da Rocha Neto)             |\n');
fprintf('|                     Acad�mico: Raul Gabriel Carvalho de Melo           |\n');
fprintf('|                                IFCE - Maracana�                        |\n');
fprintf('+------------------------------------------------------------------------+\n');

% CARREGA OS DADOS
reply = input('[1] LOG�STICA [2] TANGENTE HIPERB�LICA\n');
       if reply == 1
          dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dataIris.dat');
       else
            dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dataIristanh.dat');
       end
       
% dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dataIris.dat');

% NORMALIZA OS DADOS
dados = [normaliza(dados(:,1:4)) dados(:,5:7)];


%% VARI�VEIS INICIAIS
% N�MERO DE REALIZA��ES, TAXA DE APRENDIZAGEM E N�MERO DE �POCAS
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

    % TREINA A REDE COM QUANTIDADE X DE �POCAS
    [W] = treino(X_treino, Y_treino, eta, n_epocas, n_atributos, n_neurons,reply);
%     % TESTE DA REDE, LOG�STICA/TANH
    [acertos] = teste(X_teste, Y_teste, W, reply);
%   
%     % PERCENTUAL DE ACERTOS DE CADA REALIZA��O 
     perc = (acertos * 100) / size(X_teste, 1);
%     
%     % PERCENTUAL DE ACERTOS DE CADA REALIZA��O PARA FUN��O TANGENTE
%     % HIPERB�LICA
%     perc1 = (acertos1 * 100) / size(X_teste, 1);
%     % ARMAZENA EM UM VETOR DE ACERTOS
     vetor_acertos(i) = perc;
%     vetor_acertos1(i) = perc1;

end


% RESULTADOS PARA LOG�STICA
% disp('Fun��o LOG�STICA');
fprintf('\n\tN�mero de realiza��es: %i\n', realizacoes);
fprintf('\tAcur�cia m�dia: %.2f\n', mean(vetor_acertos));
fprintf('\tMenor acur�cia: %.2f\n', min(vetor_acertos));
fprintf('\tMaior acur�cia: %.2f\n', max(vetor_acertos));
fprintf('\tDesvio padr�o: %.2f\n\n', std(vetor_acertos));
% 
% % RESULTADOS PARA TANGENTE HIPERB�LICA
% disp('Fun��o TANGENTE HIPERB�LICA');
% fprintf('\n\tN�mero de realiza��es: %i\n', realizacoes);
% fprintf('\tAcur�cia m�dia: %.2f\n', mean(vetor_acertos1));
% fprintf('\tMenor acur�cia: %.2f\n', min(vetor_acertos1));
% fprintf('\tMaior acur�cia: %.2f\n', max(vetor_acertos1));
% fprintf('\tDesvio padr�o: %.2f\n\n', std(vetor_acertos1));
