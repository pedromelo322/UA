clear all; close all; clc;

% Carregar dados
load('InputData.mat');
nNodes = size(Nodes, 1);
nLinks = size(Links, 1);
nFlows = size(T, 1);

fprintf('--- TAREFA 8 ---\n');

%% 8.a Determinar caminho mais curto para cada fluxo
fprintf('\n8.a) Caminhos mais curtos:\n');
k = 1;
sP_short = cell(1, nFlows);
for f = 1:nFlows
    [shortestPath, totalCost] = kShortestPath(L, T(f, 1), T(f, 2), k);
    sP_short{f} = shortestPath{1};
    fprintf('Flow %d (%d->%d): length=%.1f, Path=%s\n', ...
        f, T(f,1), T(f,2), totalCost(1), num2str(shortestPath{1}));
end

%% 8.b Determinar Worst Link Load com caminhos mais curtos
fprintf('\n8.b) Cargas nos links (Shortest Path):\n');
sol_short = ones(1, nFlows); % O índice é sempre 1 pois só calculamos 1 caminho
% A função calcLinkLoads espera uma célula de células.
% sP_short é uma célula de vetores: {[1 2 3], [1 4 5], ...}
% Precisamos de a transformar numa célula de células de vetores: {{[1 2 3]}, {[1 4 5]}, ...}
sP_para_calc = cell(1, nFlows);
for f=1:nFlows
    sP_para_calc{f} = {sP_short{f}};
end
Loads = calcLinkLoads(nNodes, Links, T, sP_para_calc, sol_short);
maxLoad = max(max(Loads(:, 3:4)));
fprintf('Worst Link Load = %.2f Gbps\n', maxLoad);
% Imprimir cargas individuais
for i=1:nLinks
     fprintf('Link (%d-%d): %.2f %.2f\n', Loads(i,1), Loads(i,2), Loads(i,3), Loads(i,4));
end

%% 8.c Determinar k=4 caminhos para o Fluxo 1
fprintf('\n8.c) k=4 caminhos mais curtos para o Fluxo 1:\n');
[paths_f1, costs_f1] = kShortestPath(L, T(1, 1), T(1, 2), 4);
for i = 1:length(paths_f1)
    fprintf('Path %d: %s (length=%.1f)\n', i, num2str(paths_f1{i}), costs_f1(i));
end

%% Pré-cálculo de caminhos candidatos para 8.d - 8.h
% Calcula TODOS os caminhos (k=inf) e k=6 caminhos
fprintf('\nPre-calculating paths...\n');
k_inf = 100; % Usamos um valor alto para simular "todos"
k_6 = 6;

sP_all = cell(1, nFlows); nSP_all = zeros(1, nFlows);
sP_6 = cell(1, nFlows);   nSP_6 = zeros(1, nFlows);

for f = 1:nFlows
    % Todos os caminhos
    [p_all, ~] = kShortestPath(L, T(f,1), T(f,2), k_inf);
    sP_all{f} = p_all;
    nSP_all(f) = length(p_all);
    
    % Top 6 caminhos
    [p_6, ~] = kShortestPath(L, T(f,1), T(f,2), k_6);
    sP_6{f} = p_6;
    nSP_6(f) = length(p_6);
end

%% 8.d Random Algorithm (All paths, 5 sec)
fprintf('\n8.d) Random Algorithm (All paths):\n');
[~, bestLoad, noCycles, avLoad, bTime] = RandomAlgorithm(nNodes, Links, T, sP_all, nSP_all, 5);
fprintf('Best WLL = %.2f, Soluções = %d, Tempo Melhor = %.2fs\n', bestLoad, noCycles, bTime);

%% 8.e Random Algorithm (k=6 paths, 5 sec)
fprintf('\n8.e) Random Algorithm (k=6 paths):\n');
[~, bestLoad, noCycles, avLoad, bTime] = RandomAlgorithm(nNodes, Links, T, sP_6, nSP_6, 5);
fprintf('Best WLL = %.2f, Soluções = %d, Tempo Melhor = %.2fs\n', bestLoad, noCycles, bTime);

%% 8.g Greedy Randomized (All paths, 5 sec)
fprintf('\n8.g) Greedy Randomized (All paths):\n');
[~, bestLoad, noCycles, avLoad, bTime] = GreedyRandomizedAlgorithm(nNodes, Links, T, sP_all, nSP_all, 5);
fprintf('Best WLL = %.2f, Soluções = %d, Tempo Melhor = %.2fs\n', bestLoad, noCycles, bTime);

%% 8.h Greedy Randomized (k=6 paths, 5 sec)
fprintf('\n8.h) Greedy Randomized (k=6 paths):\n');
[~, bestLoad, noCycles, avLoad, bTime] = GreedyRandomizedAlgorithm(nNodes, Links, T, sP_6, nSP_6, 5);
fprintf('Best WLL = %.2f, Soluções = %d, Tempo Melhor = %.2fs\n', bestLoad, noCycles, bTime);