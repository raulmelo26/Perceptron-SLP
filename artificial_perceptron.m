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
          dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dadosArtificiais.dat');
       else
            dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dataArtificialtangh.dat');
       end
% dados = load('C:\Users\Raul Melo\Documents\Perceptron SLP\dadosArtificias.dat');

% NORMALIZA OS DADOS
dados = [normaliza(dados(:,1:2)) dados(:,3:5)];

graficoData = figure(1); hold on;
scatter(dados(1:200,1),dados(1:200,2),'filled');
scatter(dados(201:400,1),dados(201:400,2),'filled');
scatter(dados(401:600,1),dados(401:600,2),'filled');
title('Classifica��o');
legend('Classe 1','Classe 2','Classe 3');


%% VARI�VEIS INICIAIS

% N�MERO DE REALIZA��ES
realizacoes = 20;
pontuacoes = zeros(realizacoes, 1);
% TAXA DE APRENDIZAGEM E N�MERO DE �POCAS
eta = 0.07;
n_epocas = 250;

n_neurons = 3;
n_atributos = 2;
m = size(dados,1);

%%

for i = 1 : realizacoes
    % EMBARALHA OS DADOS
    dados = dados(randperm(m),:);
    
    [dadosTreino,dadosTeste] = separaDados(dados,0.8);
    X_treino = dadosTreino(:,1:2);
    Y_treino = dadosTreino(:,3:5);
    X_teste  = dadosTeste(:,1:2);
    Y_teste  = dadosTeste(:,3:5);
  
    % TREINA A REDE COM QUANTIDADE X DE �POCAS
    [W] = treino(X_treino, Y_treino, eta, n_epocas, n_atributos, n_neurons, reply);

    % TESTE DA REDE, LOG�STICA/TANH
    [acertos] = teste(X_teste, Y_teste, W, reply);
    
    % PERCENTUAL DE ACERTOS DE CADA REALIZA��O PARA FUN��O LOG�STICA
    perc = (acertos * 100) / size(X_teste, 1);
    % PERCENTUAL DE ACERTOS DE CADA REALIZA��O PARA FUN��O TANGENTE
    % HIPERB�LICA
 
    % ARMAZENA EM UM VETOR DE ACERTOS
    vetor_acertos(i) = perc;
 

end
v1_W = W(1,:);
% Plotagem da reta 1
x1 = linspace(0,1,10);
% Formula do livro
x2 = -(v1_W(2)/v1_W(3))*x1+(v1_W(1)/v1_W(3));
plot(x1,x2);

v1_W = W(2,:);
% Plotagem da reta 2
x1 = linspace(0,1,10);
% Formula do livro
x2 = -(v1_W(2)/v1_W(3))*x1+(v1_W(1)/v1_W(3));
plot(x1,x2);

v1_W = W(3,:);
% Plotagem da reta 3
x1 = linspace(0,1,10);
% Formula do livro
x2 = -(v1_W(2)/v1_W(3))*x1+(v1_W(1)/v1_W(3))
plot(x1,x2);

xlabel('x');
ylabel('y');
xlim([0 1])
ylim([0 1])

% RESULTADOS PARA LOG�STICa/TANGH
fprintf('\n\tN�mero de realiza��es: %i\n', realizacoes);
fprintf('\tAcur�cia m�dia: %.2f\n', mean(vetor_acertos));
fprintf('\tMenor acur�cia: %.2f\n', min(vetor_acertos));
fprintf('\tMaior acur�cia: %.2f\n', max(vetor_acertos));
fprintf('\tDesvio padr�o: %.2f\n\n', std(vetor_acertos));

