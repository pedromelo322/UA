n = 20;    %nº de dardos
m = 100;   %nº de alvos
N = 1e5;   % número de simulações

% Probabilidade de nenhum alvo ser atingido mais de uma vez (parte a)
prob_a = dardos(n,m,N);

% Probabilidade de pelo menos 1 alvo ser atingido 2 ou mais vezes (parte b)
prob_b = 1 - prob_a