% -------------------------------------------------------------------------
% Script MATLAB para calcular os valores teóricos M/G/1
% -------------------------------------------------------------------------

% Parâmetros de Entrada
lambda = 1800;       % Taxa de chegada de pacotes (pps)
C = 10 * 1e6;        % Capacidade do link (bps)

% 1. CÁLCULO DE E[L] e E[L^2] (Tamanho e Segundo Momento do Tamanho do Pacote)

% 1.1. Contribuições discretas
L_disc = [64, 110, 1518];
P_disc = [0.19, 0.23, 0.17];

% 1.2. Contribuições restantes (Uniforme Discreta)
P_rest = 1 - sum(P_disc); % 0.41
tamanhos_restantes = [65:109, 111:1517];
N_rest = length(tamanhos_restantes); % 1451 valores
P_i = P_rest / N_rest;              % Probabilidade de cada valor restante

% Média e Média Quadrática dos valores restantes
L_medio_rest = mean(tamanhos_restantes);
L2_medio_rest = mean(tamanhos_restantes.^2);

% 1.3. E[L] (L_medio)
L_medio = sum(L_disc .* P_disc) + (L_medio_rest * P_rest);

% 1.4. E[L^2] (L2_medio)
% E[L^2] = sum(P_disc * L_disc^2) + sum(P_i * L_i^2)
L2_medio = sum(P_disc .* (L_disc.^2)) + (L2_medio_rest * P_rest);

fprintf('L_medio (Bytes): %.4f\n', L_medio);
fprintf('L2_medio (Bytes^2): %.4f\n\n', L2_medio);


% 2. CÁLCULO DE E[S] e E[S^2] (Tempo de Serviço)

% O tempo de serviço S = (L * 8) / C
bits_por_Byte = 8;
E_S = (L_medio * bits_por_Byte) / C;
E_S2 = (L2_medio * (bits_por_Byte^2)) / (C^2);

fprintf('E[S] (segundos): %.4e\n', E_S);
fprintf('E[S^2] (segundos^2): %.4e\n\n', E_S2);


% 3. CÁLCULO DA UTILIZAÇÃO, THROUGHPUT E PERDAS

% 3.1. Utilização do Servidor (rho)
rho = lambda * E_S;

% 3.2. Throughput Teórico (TT)
% Como a Utilização rho é menor que 1 (rho < 1), o sistema é estável, e as perdas
% no M/G/1 (fila infinita) são nulas. O Throughput é igual à taxa de chegada
% de bits.
PL_teo = 0.0000; % Perdas nulas em fila infinita (M/G/1)

% TT (Mbps) = lambda * L_medio * 8 / 10^6
TT_teo = (lambda * L_medio * bits_por_Byte) / 1e6;

fprintf('Rho (Utilização): %.4f\n', rho);
fprintf('Packet Loss (%%): %.4f\n', PL_teo);
fprintf('Throughput (Mbps): %.4f\n\n', TT_teo);


% 4. CÁLCULO DO ATRASO MÉDIO (E[W] e E[D]) - FÓRMULA P-K

% 4.1. Atraso médio na fila (E[W]) - Fórmula de Pollaczek-Khinchine (P-K)
E_W = (lambda * E_S2) / (2 * (1 - rho));

% 4.2. Atraso médio no Sistema (E[D]) - Atraso na Fila + Tempo de Serviço
E_D = E_W + E_S;

% 4.3. Conversão para milissegundos (ms)
APD_teo = E_D * 1000;

fprintf('E[W] (Atraso na Fila - segundos): %.4e\n', E_W);
fprintf('Av. Packet Delay (ms): %.4f\n', APD_teo);

fprintf('\n----------------------------------------------------\n');
fprintf('RESULTADOS TEÓRICOS M/G/1 (5.c)\n');
fprintf('----------------------------------------------------\n');
fprintf('Packet Loss (%%) = %.4f\n', PL_teo);
fprintf('Av. Packet Delay (ms) = %.4f\n', APD_teo);
fprintf('Throughput (Mbps) = %.4f\n', TT_teo);
fprintf('----------------------------------------------------\n');