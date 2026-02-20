clear all; close all; clc;

% Carregar dados da Tarefa 9
load('InputData2.mat');
nNodes = size(Nodes, 1);
nLinks = size(Links, 1);
nFlows = size(T, 1);

fprintf('--- TAREFA 9 ---\n');

%% Pré-cálculo de caminhos
fprintf('Pre-calculating paths (All & k=6)...\n');
k_inf = 100; % Simular "todos"
k_6 = 6;

sP_all = cell(1, nFlows); nSP_all = zeros(1, nFlows);
sP_6 = cell(1, nFlows);   nSP_6 = zeros(1, nFlows);

for f = 1:nFlows
    % Todos
    [p_all, ~] = kShortestPath(L, T(f,1), T(f,2), k_inf);
    sP_all{f} = p_all;
    nSP_all(f) = length(p_all);
    
    % k=6
    [p_6, ~] = kShortestPath(L, T(f,1), T(f,2), k_6);
    sP_6{f} = p_6;
    nSP_6(f) = length(p_6);
end

%% 9.a Estatísticas dos caminhos
fprintf('\n9.a) Statistics:\n');
min_paths = min(nSP_all);
max_paths = max(nSP_all);

% Imprimir fluxos com o número mínimo de caminhos
fprintf('Minimum no. of paths= %d\n', min_paths);
min_flows = find(nSP_all == min_paths);
for i = 1:length(min_flows)
    f = min_flows(i);
    fprintf('Flow %d (%d -> %d)\n', f, T(f,1), T(f,2));
end

% Imprimir fluxos com o número máximo de caminhos
fprintf('Maximum no. of paths= %d\n', max_paths);
max_flows = find(nSP_all == max_paths);
for i = 1:length(max_flows)
    f = max_flows(i);
    fprintf('Flow %d (%d -> %d)\n', f, T(f,1), T(f,2));
end

timeLim = 5;

%% 9.c Executar Algoritmos (ALL PATHS)
fprintf('\n--- 9.c) ALL POSSIBLE PATHS ---\n');

% Algoritmo A: Random
fprintf('Alg A (Random): ');
[~, bLoad, nCyc, avL, bTime] = RandomAlgorithm(nNodes, Links, T, sP_all, nSP_all, timeLim);
fprintf('W=%.2f, N.Sol=%d, Av.W=%.2f, Time=%.2f\n', bLoad, nCyc, avL, bTime);

% Algoritmo B: Greedy Randomized
fprintf('Alg B (Greedy): ');
[~, bLoad, nCyc, avL, bTime] = GreedyRandomizedAlgorithm(nNodes, Links, T, sP_all, nSP_all, timeLim);
fprintf('W=%.2f, N.Sol=%d, Av.W=%.2f, Time=%.2f\n', bLoad, nCyc, avL, bTime);

% Algoritmo C: MSHC (Random Init) - Strategy 1
fprintf('Alg C (MSHC-R): ');
[~, bLoad, nCyc, avL, bTime] = MultiStartHillClimbing(nNodes, Links, T, sP_all, nSP_all, timeLim, 1);
fprintf('W=%.2f, N.Sol=%d, Av.W=%.2f, Time=%.2f\n', bLoad, nCyc, avL, bTime);

% Algoritmo D: MSHC (Greedy Init) - Strategy 2
fprintf('Alg D (MSHC-G): ');
[~, bLoad, nCyc, avL, bTime] = MultiStartHillClimbing(nNodes, Links, T, sP_all, nSP_all, timeLim, 2);
fprintf('W=%.2f, N.Sol=%d, Av.W=%.2f, Time=%.2f\n', bLoad, nCyc, avL, bTime);


%% 9.d Executar Algoritmos (k=6 PATHS)
fprintf('\n--- 9.d) K=6 SHORTEST PATHS ---\n');

% Algoritmo A
fprintf('Alg A (Random): ');
[~, bLoad, nCyc, avL, bTime] = RandomAlgorithm(nNodes, Links, T, sP_6, nSP_6, timeLim);
fprintf('W=%.2f, N.Sol=%d, Av.W=%.2f, Time=%.2f\n', bLoad, nCyc, avL, bTime);

% Algoritmo B
fprintf('Alg B (Greedy): ');
[~, bLoad, nCyc, avL, bTime] = GreedyRandomizedAlgorithm(nNodes, Links, T, sP_6, nSP_6, timeLim);
fprintf('W=%.2f, N.Sol=%d, Av.W=%.2f, Time=%.2f\n', bLoad, nCyc, avL, bTime);

% Algoritmo C
fprintf('Alg C (MSHC-R): ');
[~, bLoad, nCyc, avL, bTime] = MultiStartHillClimbing(nNodes, Links, T, sP_6, nSP_6, timeLim, 1);
fprintf('W=%.2f, N.Sol=%d, Av.W=%.2f, Time=%.2f\n', bLoad, nCyc, avL, bTime);

% Algoritmo D
fprintf('Alg D (MSHC-G): ');
[~, bLoad, nCyc, avL, bTime] = MultiStartHillClimbing(nNodes, Links, T, sP_6, nSP_6, timeLim, 2);
fprintf('W=%.2f, N.Sol=%d, Av.W=%.2f, Time=%.2f\n', bLoad, nCyc, avL, bTime);