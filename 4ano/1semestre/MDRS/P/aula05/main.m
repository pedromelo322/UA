clear all
close all
clc

load('InputData.mat')
nNodes= size(Nodes,1);
nLinks= size(Links,1);
nFlows= size(T,1);

% Plotting network in figure 10:
plotGraph(Nodes,Links,10);

% Computing k=10 shortest paths for flow f= 4:
k= 10;
f= 4;
[shortestPath, totalCost] = kShortestPath(L,T(f,1),T(f,2),k);

% Visualizing the 6th path and its length:
i= 6;
fprintf('Path %d:  %s  (length= %.1f)\n\n',i,num2str(shortestPath{i}),totalCost(i));

% Computing up to k=6 shortest paths for all flows from 1 to nFlows:
k= 6;
sP= cell(1,nFlows);
nSP= zeros(1,nFlows);
for f=1:nFlows
    [shortestPath, totalCost] = kShortestPath(L,T(f,1),T(f,2),k);
    sP{f}= shortestPath;
    nSP(f)= length(totalCost);
end
% sP{f}{i} is the i-th path of flow f
% nSP(f) is the number of paths of flow f

% Visualizing all paths of flow 2:
f= 2;
for i= 1:nSP(f)
    fprintf('Flow %d - Path %d:  %s\n',f,i,num2str(sP{f}{i}));
end

% Compute the link loads using the first (shortest) path of each flow:
sol= ones(1,nFlows);
Loads= calcLinkLoads(nNodes,Links,T,sP,sol);
% Determine the worst link load:
maxLoad= max(max(Loads(:,3:4)));

%%
% OPTIMIZATION ALGORITHM:
%   - based on random strategy
%   - with all candidate routing paths
%   - with time limit of 5 seconds
timeLimit= 5;
k= inf;
sP= cell(1,nFlows);
nSP= zeros(1,nFlows);
for f=1:nFlows
    [shortestPath, totalCost] = kShortestPath(L,T(f,1),T(f,2),k);
    sP{f}= shortestPath;
    nSP(f)= length(totalCost);
end
[bestSol,bestLoad,noCycles,avObjective,bestTime] = RandomAlgorithm(nNodes,Links,T,sP,nSP,timeLimit);

%Output of routing solution:
fprintf('\nRouting paths of the solution:\n')
for f= 1:nFlows
    selectedPath= bestSol(f);
    fprintf('Flow %d - Path %d:  %s\n',f,selectedPath,num2str(sP{f}{selectedPath}));
end
bestLoads= calcLinkLoads(nNodes,Links,T,sP,bestSol);
%Output of link loads of the routing solution:
fprintf('Worst link load of the best solution = %.2f\n',bestLoad);
fprintf('Link loads of the best solution:\n')
for i= 1:nLinks
    fprintf('{%d-%d}:\t%.2f\t%.2f\n',bestLoads(i,1),bestLoads(i,2),bestLoads(i,3),bestLoads(i,4))
end
%Output of performace values:
fprintf('No. of generated solutions = %d\n',noCycles);
fprintf('Avg. worst link load among all solutions= %.2f\n',avObjective);
fprintf('Running time of the best solution= %.2f\n',bestTime);


