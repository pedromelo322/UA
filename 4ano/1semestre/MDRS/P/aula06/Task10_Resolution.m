clear all; close all; clc;
load('InputData2.mat');

nNodes = size(Nodes,1);
nLinks = size(Links,1);
nFlows = size(T,1);

% Dados do enunciado
MTTR = 24;
CC = 450;
MTBF = (CC * 365 * 24) ./ L;
A = MTBF ./ (MTBF + MTTR);
A(isnan(A)) = 0; % Tratar links inexistentes
Alog = -log(A);  % Custo para o kShortestPath

% Variáveis para guardar resultados para as alíneas seguintes
sP = cell(2, nFlows); 
avail_10a = zeros(1, nFlows);

%% 10.a

fprintf('--- 10.a ---\n');
for f = 1:nFlows
    % Calcular 1 caminho mais curto (custo = -log(A))
    [shortestPath, ~] = kShortestPath(Alog, T(f,1), T(f,2), 1);
    sP{1,f} = shortestPath{1};
    path = sP{1,f};
    
    % Calcular disponibilidade linear do caminho: Produtorio(A_links)
    av = 1;
    for i = 1:length(path)-1
        av = av * A(path(i), path(i+1));
    end
    avail_10a(f) = av;
    
    % Formato de saída exato do PDF 
    fprintf('Flow %d: Availability= %.7f - Path= %s\n', f, av, num2str(path));
end

%% 10.b
fprintf('\n--- 10.b ---\n');
avg_avail = mean(avail_10a);
% Formato de saída do PDF 
fprintf('Average availability = %.7f\n', avg_avail);

%% 10.c
fprintf('\n--- 10.c ---\n');
avail_10c = zeros(1, nFlows);

for f = 1:nFlows
    path1 = sP{1,f};
    
    % Criar matriz auxiliar e remover links do path1
    Aaux = Alog;
    for i = 1:length(path1)-1
        Aaux(path1(i), path1(i+1)) = inf;
        Aaux(path1(i+1), path1(i)) = inf;
    end
    
    % Calcular path 2
    [shortestPath, ~] = kShortestPath(Aaux, T(f,1), T(f,2), 1);
    
    if ~isempty(shortestPath)
        sP{2,f} = shortestPath{1};
        path2 = sP{2,f};
        
        % Calcular disponibilidade do path 2
        av2 = 1;
        for i = 1:length(path2)-1
            av2 = av2 * A(path2(i), path2(i+1));
        end
        
        % Disponibilidade total (Paralelo): 1 - (Indisp1 * Indisp2)
        av1 = avail_10a(f);
        total_av = 1 - ((1 - av1) * (1 - av2));
        avail_10c(f) = total_av;
        
        % Formato de saída exato do PDF 
        fprintf('Flow %d: Availability = %.7f\t- Path1= %s\n\t\t\t\t\t- Path2= %s\n\n', f, total_av, num2str(path1), num2str(path2));
    else
        % Se não houver segundo caminho, a disponibilidade é a do primeiro.
        avail_10c(f) = avail_10a(f);
        % Imprime o caminho 1 e a informação de que não há um segundo.
        fprintf('Flow %d: Availability = %.7f\t- Path1= %s\n\t\t\t\t\t- Path2= \n\n', f, avail_10a(f), num2str(path1));
    end
end

%% 10.d
fprintf('\n--- 10.d ---\n');
avg_avail_prot = mean(avail_10c);
% Formato de saída do PDF 
fprintf('Average availability = %.7f\n', avg_avail_prot);

%% 10.e
fprintf('\n--- 10.e ---\n');
sol = ones(1, nFlows); % Indica que queremos usar o par de caminhos calculado (index 1 do código, mas a função processa sP{1} e sP{2})
% As funções 'calculateLinkBand...' esperam que sP{:,f} seja uma cell contendo caminhos.
% No entanto, neste script, sP{:,f} é o próprio caminho (um array).
% Para compatibilizar, criamos uma cell temporária 'sP_temp' com a estrutura correta.
sP_temp = cell(2, nFlows);
for f=1:nFlows
    sP_temp{1,f} = {sP{1,f}}; % Envolve o caminho numa cell
    sP_temp{2,f} = {sP{2,f}}; % Envolve o caminho numa cell
end
Loads1plus1 = calculateLinkBand1plus1(nNodes, Links, T, sP_temp, sol);

maxLoad = max(max(Loads1plus1(:, 3:4)));
totalBand = sum(sum(Loads1plus1(:, 3:4)));

% Formato de saída do PDF 
fprintf('Worst bandwidth capacity = %.1f Gbps\n', maxLoad);
fprintf('Total bandwidth capacity on all links = %.1f Gbps\n', totalBand);

for i = 1:nLinks
    % Formatação específica para alinhar com o PDF: { a- b}: val1 val2
    fprintf('{%2d-%2d}:\t%.2f\t%.2f\n', ...
        Loads1plus1(i,1), Loads1plus1(i,2), Loads1plus1(i,3), Loads1plus1(i,4));
end

%% 10.f
fprintf('\n--- 10.f ---\n');
Loads1to1 = calculateLinkBand1to1(nNodes, Links, T, sP_temp, sol);

maxLoad1to1 = max(max(Loads1to1(:, 3:4)));
totalBand1to1 = sum(sum(Loads1to1(:, 3:4)));

% Formato de saída do PDF 
fprintf('Worst bandwidth capacity = %.1f Gbps\n', maxLoad1to1);
fprintf('Total bandwidth capacity on all links = %.1f Gbps\n', totalBand1to1);

for i = 1:nLinks
    fprintf('{%2d-%2d}:\t%.2f\t%.2f\n', ...
        Loads1to1(i,1), Loads1to1(i,2), Loads1to1(i,3), Loads1to1(i,4));
end