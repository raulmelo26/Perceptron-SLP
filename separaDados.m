% Raul Melo
% Separa os dados de treinamento e teste

function [dados_treino, dados_teste] = separaDados(conjCompleto, porcentagem_treino)
  ultima_linha_treino = round(porcentagem_treino*size(conjCompleto,1));
  dados_treino = conjCompleto(1:ultima_linha_treino,:);
  dados_teste = conjCompleto(ultima_linha_treino + 1:end,:);
end
  