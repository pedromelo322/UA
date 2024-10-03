n = 6; %Faces
m = 2; %Lançamentos
N = 1e5; %Simulações

tentativas = randi(n, m, N);

% Simulação do A

sucessA = sum(tentativas) == 9;

probSimulacaoA = sum(sucessA) / N

% Simulação do B prob = 0.5

segunda_linha = tentativas(2:N);

par =  sum(mod(segunda_linha, 2) == 0);

probSimulacaoB = par/N




% Simulação do C

linha1 = tentativas(1,:) == 5;
linha2 = tentativas(2,:) == 5;

probSimulacaoC = sum(linha1 + linha2 - (linha1 & linha2))/N


%Simulação do D prob = 25/36
