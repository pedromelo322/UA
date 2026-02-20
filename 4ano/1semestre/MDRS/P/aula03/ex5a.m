% input parameters of Simulator1:
% lambda − packet rate, in packets per second (pps)
% C – link capacity, in Mbps
% f − queue size, in Bytes
% P − total number of transmitted packets of a simulation run


% ---------------------------------
% 1. Definição de Parâmetros
% ---------------------------------
lambda = 1800;   % Taxa de chegada de pacotes (pps)
C = 10;          % Capacidade do link (Mbps)
f = 1000000;     % Tamanho da fila (Bytes)
P = 10000;       % N.º total de pacotes transmitidos (critério de paragem)

N = 10;          % Número de simulações para o intervalo de confiança [cite: 150]
alfa = 0.1;      % Nível de significância para 90% de confiança


% ---------------------------------
% 2. Execução Múltipla do Simulador
% ---------------------------------
% Vetores para armazenar os resultados das N simulações [cite: 150]
PL_values = zeros(1, N);
APD_values = zeros(1, N);
MPD_values = zeros(1, N);
TT_values = zeros(1, N);

for it = 1:N
    % *** IMPORTANTE: Para obter resultados IID (independentes e identicamente
    % distribuídos), é crucial garantir que cada corrida do simulador utilize
    % uma semente aleatória diferente (seed)[cite: 155, 156].
    
    % Se o Simulator1 não mudar a semente internamente, é preciso adicioná-la aqui:
    % rng('shuffle'); % Isto define a semente com base na hora atual
    
    % Chama o simulador. Assume-se que a função 'Simulator1' existe no path do MATLAB
    [PL_values(it), APD_values(it), MPD_values(it), TT_values(it)] = Simulator1(lambda, C, f, P);
    
    fprintf('Simulação %d/%d concluída.\n', it, N);
end



% ---------------------------------
% 3. Cálculo do Intervalo de Confiança (IC)
% ---------------------------------

% Valor crítico z_1-alfa/2
z_critico = norminv(1 - alfa/2);

% --- PL (Packet Loss) ---
media_PL = mean(PL_values);
termo_PL = z_critico * sqrt(var(PL_values) / N);
fprintf('Packet Loss (%%) = %.2e +- %.2e\n', media_PL, termo_PL);

% --- APD (Average Packet Delay) ---
media_APD = mean(APD_values);
termo_APD = z_critico * sqrt(var(APD_values) / N);
fprintf('Av. Packet Delay (ms) = %.2e +- %.2e\n', media_APD, termo_APD);

% --- MPD (Maximum Packet Delay) ---
media_MPD = mean(MPD_values);
termo_MPD = z_critico * sqrt(var(MPD_values) / N);
fprintf('Max. Packet Delay (ms) = %.2e +- %.2e\n', media_MPD, termo_MPD);

% --- TT (Transmitted Throughput) ---
media_TT = mean(TT_values);
termo_TT = z_critico * sqrt(var(TT_values) / N);
fprintf('Throughput (Mbps) = %.2e +- %.2e\n', media_TT, termo_TT);