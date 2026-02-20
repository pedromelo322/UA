% Script to run Simulator3 for Task 7.b

% Input Parameters
lambda = 1800;  % pps
C = 10;         % Mbps
f = 10000;      % Bytes (~10 KBytes)
P = 10000;      % Transmitted data packets
n = 20;         % Number of VoIP flows
N = 100;        % Number of simulations

% Vectors to store results from N simulations
PL_data_vec = zeros(1, N);
PL_VoIP_vec = zeros(1, N);
APD_data_vec = zeros(1, N);
APD_VoIP_vec = zeros(1, N);
MPD_data_vec = zeros(1, N);
MPD_VoIP_vec = zeros(1, N);
TT_vec = zeros(1, N);

% Run simulation N times
fprintf('Running %d simulations...\n', N);
for i = 1:N
    [PL_data_vec(i), PL_VoIP_vec(i), APD_data_vec(i), APD_VoIP_vec(i), ...
     MPD_data_vec(i), MPD_VoIP_vec(i), TT_vec(i)] = Simulator3(lambda, C, f, P, n);
    fprintf('Simulation %d/%d completed.\n', i, N);
end
fprintf('All simulations finished.\n\n');

% Calculate average values and confidence intervals
% For 90% confidence interval with N=100, t-student value is approx. 1.66
% For a more general case, use tinv(0.95, N-1)
alfa = 0.10; % 1 - confidence level
t_student = tinv(1 - alfa/2, N - 1);

% --- Results ---
% Packet Loss Data
media = mean(PL_data_vec);
term = t_student * sqrt(var(PL_data_vec) / N);
fprintf('PacketLoss of data (%%) = %.2e +- %.2e\n', media, term);

% Packet Loss VoIP
media = mean(PL_VoIP_vec);
term = t_student * sqrt(var(PL_VoIP_vec) / N);
fprintf('PacketLoss of VoIP (%%) = %.2e +- %.2e\n', media, term);

% Average Delay Data
media = mean(APD_data_vec);
term = t_student * sqrt(var(APD_data_vec) / N);
fprintf('Av. Packet Delay of data (ms) = %.2e +- %.2e\n', media, term);

% Average Delay VoIP
media = mean(APD_VoIP_vec);
term = t_student * sqrt(var(APD_VoIP_vec) / N);
fprintf('Av. Packet Delay of VoIP (ms) = %.2e +- %.2e\n', media, term);

% Maximum Delay Data
media = mean(MPD_data_vec);
term = t_student * sqrt(var(MPD_data_vec) / N);
fprintf('Max. Packet Delay of data (ms) = %.2e +- %.2e\n', media, term);

% Maximum Delay VoIP
media = mean(MPD_VoIP_vec);
term = t_student * sqrt(var(MPD_VoIP_vec) / N);
fprintf('Max. Packet Delay of VoIP (ms) = %.2e +- %.2e\n', media, term);

% Transmitted Throughput
media = mean(TT_vec);
term = t_student * sqrt(var(TT_vec) / N);
fprintf('Throughput (Mbps) = %.2e +- %.2e\n', media, term);


% 1. Aumento da Perda de Pacotes (PL_data e PL_VoIP)
% Com uma fila de 1 MByte, o sistema tinha capacidade mais do que suficiente para absorver as rajadas de tráfego
% Com uma fila de apenas 10 KBytes, essa capacidade de absorção é extremamente limitada. Durante os picos de tráfego, a fila enche-se quase instantaneamente. Qualquer pacote que chegue e encontre a fila cheia é imediatamente descartado, resultando em perdas por transbordo de buffer
% PL_data > PL_VoIP:
% Tamanho dos Pacotes: Os pacotes de dados podem ser grandes, até 1518 Bytes. Um único pacote de dados de grande dimensão consome uma porção significativa (mais de 15%) da fila de 10 KBytes. Em contrapartida, os pacotes VoIP são pequenos e de tamanho uniforme (110-130 Bytes). Isto significa que os pacotes de dados contribuem muito mais para o congestionamento da fila.

% 2. Redução Drástica do Atraso Médio e Máximo (APD e MPD)
% Na alínea 7.b, com a fila grande, os pacotes podiam acumular-se e esperar por um tempo considerável antes de serem transmitidos, levando a atrasos médios e máximos elevados.
% Na alínea 7.c, com a fila pequena, os pacotes não têm a "oportunidade" de sofrer longas esperas. Um pacote tem apenas dois destinos: ou encontra a fila com poucos pacotes e é transmitido rapidamente (resultando num baixo atraso), ou encontra a fila cheia e é descartado (não contribuindo para as estatísticas de atraso).