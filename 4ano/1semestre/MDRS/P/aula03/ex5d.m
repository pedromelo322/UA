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
f = 10000;     % Tamanho da fila (Bytes)
P = 10000;       % N.º total de pacotes transmitidos (critério de paragem)

N = 100;          % Número de simulações para o intervalo de confiança [cite: 150]
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




% A principal diferença é a redução drástica do tamanho da fila (f) de 1.000.000 Bytes (1 MByte) para 10.000 Bytes (10 KBytes).
% 
%     Aumento do Packet Loss (PL):
% 
%         O PL salta de 0.00 (perdas nulas) para 1.01.
% 
%         Justificativa: Com uma fila muito menor, o sistema atinge o buffer overflow mais rapidamente. Pacotes que chegavam durante picos de tráfego e encontravam a fila cheia na experiência 5.d são agora descartados, pois não há espaço de armazenamento.
% 
%     Diminuição do Atraso Médio de Pacote (APD):
% 
%         O APD diminui de 4.32 ms para 2.95 ms.
% 
%         Justificativa: No modelo M/G/1, o atraso é composto pelo atraso na fila (E[W]) mais o tempo de serviço (E[S]). Ao reduzir a fila, o tempo máximo que um pacote pode esperar diminui drasticamente. Os pacotes que teriam longos atrasos na fila (em 5.b) são agora descartados (em 5.d). Pacotes descartados não contribuem para o APD, o que faz a média do atraso dos pacotes transmitidos diminuir.
% 
%     Diminuição do Throughput (TT):
% 
%         O TT diminui de 8.93 Mbps para 8.75 Mbps.
% 
%         Justificativa: O Throughput é a taxa de bits transmitidos com sucesso. Com 1.01 de perdas, o sistema está a transmitir apenas 100−1.01=98.99 do tráfego de chegada. O TT máximo possível era ≈8.9283 Mbps (Taxa de Chegada). O TT real torna-se: TTreal​=TTmaˊximo​×(1−PL)≈8.9283×(1−0.0101)≈8.837 Mbps. O valor simulado (8.75 Mbps) está de acordo com esta redução devido às perdas.
