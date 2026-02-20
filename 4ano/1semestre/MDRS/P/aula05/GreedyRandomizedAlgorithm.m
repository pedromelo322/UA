function [bestSol, bestLoad, noCycles, avObjective, bestTime] = GreedyRandomizedAlgorithm(nNodes, Links, T, sP, nSP, timeLimit)
    t = tic;
    nFlows = size(T, 1);
    bestLoad = inf;
    bestSol = zeros(1, nFlows);
    noCycles = 0;
    aux = 0;

    while toc(t) < timeLimit
        % 1. Ordem aleatória dos fluxos
        order = randperm(nFlows);
        currentSol = zeros(1, nFlows);
        currentLoads = [Links zeros(size(Links, 1), 2)];

        % 2. Construção Gulosa
        for i = 1:nFlows
            flow = order(i);
            bestPathIndex = -1;
            minMaxLoad = inf;
            
            % Testa todos os caminhos candidatos para este fluxo
            for p = 1:nSP(flow)
                % Cria solução temporária apenas para teste
                tempSol = currentSol; 
                tempSol(flow) = p;
                
                % Calcula cargas apenas com os fluxos já atribuídos + o atual
                % Nota: calcLinkLoads requer vetor completo, mas ignoramos zeros
                Loads = calcLinkLoads(nNodes, Links, T, sP, tempSol);
                maxL = max(max(Loads(:, 3:4)));
                
                if maxL < minMaxLoad
                    minMaxLoad = maxL;
                    bestPathIndex = p;
                end
            end
            currentSol(flow) = bestPathIndex;
        end

        % Avalia solução final completa
        finalLoads = calcLinkLoads(nNodes, Links, T, sP, currentSol);
        finalMaxLoad = max(max(finalLoads(:, 3:4)));
        
        noCycles = noCycles + 1;
        aux = aux + finalMaxLoad;

        if finalMaxLoad < bestLoad
            bestLoad = finalMaxLoad;
            bestSol = currentSol;
            bestTime = toc(t);
        end
    end
    avObjective = aux / noCycles;
end