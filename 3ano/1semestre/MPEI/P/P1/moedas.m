function [probSimulacao] = moedas(k,n,p,N)
% MOEDAS - Calcula a probabilidade de obter k caras em n lançamentos
% A probabilidade de cara é p e a simulação é repetida N vezes.
% Uso: probSimulacao = moedas(k,n,p,N)
% k: número de caras desejadas (sucessos)
% n: número de lançamentos
% p: probabilidade de sair cara em um lançamento
% N: número de simulações

% AT, 19 set 2024, MPEI

% Simular N vezes n lançamentos com probabilidade p de cara
lancamentos = rand(n,N) < p;

% Contar o número de sucessos (k caras) em cada simulação
sucessos = sum(lancamentos) == k;

% Calcular a probabilidade estimada
probSimulacao = sum(sucessos) / N;

end
