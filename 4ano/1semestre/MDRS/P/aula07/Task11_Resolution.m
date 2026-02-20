clear all; close all; clc;
load('InputData2.mat');

nNodes = size(Nodes,1);
nLinks = size(Links,1);
nFlows = size(T,1);

% Pré-cálculo dos custos Ativos e Dormentes para uso posterior
LinkLen = L(sub2ind(size(L), Links(:,1), Links(:,2)));
ActiveCost = 20 + 0.1 * LinkLen;
SleepCost = 1;

% Pré-cálculo de caminhos (Todos e k=6)
k_all = 100; % Aproximação para "todos os caminhos"
k_6 = 6;
sP_all = cell(1, nFlows); nSP_all = zeros(1, nFlows);
sP_6 = cell(1, nFlows);   nSP_6 = zeros(1, nFlows);

% Usamos L (distância) como custo para shortest path
for f = 1:nFlows
    [paths, ~] = kShortestPath(L, T(f,1), T(f,2), k_all);
    sP_all{f} = paths;
    nSP_all(f) = length(paths);
    
    [paths6, ~] = kShortestPath(L, T(f,1), T(f,2), k_6);
    sP_6{f} = paths6;
    nSP_6(f) = length(paths6);
end

fprintf('--- Task 11 ---\n');

%% 11.a
