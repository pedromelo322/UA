function [bestSol, bestLoad, noCycles, avObjective, bestTime] = MultiStartHillClimbing(nNodes, Links, T, sP, nSP, timeLimit, strategy)
    % strategy: 1 for Random Initial, 2 for Greedy Randomized Initial
    t = tic;
    nFlows = size(T, 1);
    bestLoad = inf;
    bestSol = zeros(1, nFlows);
    noCycles = 0;
    aux = 0;

    while toc(t) < timeLimit
        % 1. Gerar Solução Inicial
        if strategy == 1
            % Random
            currentSol = zeros(1, nFlows);
            for f = 1:nFlows
                currentSol(f) = randi(nSP(f));
            end
            startLoads = calcLinkLoads(nNodes, Links, T, sP, currentSol);
            currentLoad = max(max(startLoads(:, 3:4)));
        else
            % Greedy Randomized (Simplificado para uma iteração)
            order = randperm(nFlows);
            currentSol = zeros(1, nFlows);
            for i = 1:nFlows
                flow = order(i);
                bestPathIndex = -1;
                minMaxLoad = inf;
                for p = 1:nSP(flow)
                    tempSol = currentSol; 
                    tempSol(flow) = p;
                    Lds = calcLinkLoads(nNodes, Links, T, sP, tempSol);
                    mL = max(max(Lds(:, 3:4)));
                    if mL < minMaxLoad
                        minMaxLoad = mL;
                        bestPathIndex = p;
                    end
                end
                currentSol(flow) = bestPathIndex;
            end
            startLoads = calcLinkLoads(nNodes, Links, T, sP, currentSol);
            currentLoad = max(max(startLoads(:, 3:4)));
        end

        % 2. Aplicar Hill Climbing na solução obtida
        [currentSol, currentLoad] = HillClimbing(nNodes, Links, T, sP, nSP, currentSol, currentLoad);

        noCycles = noCycles + 1;
        aux = aux + currentLoad;

        if currentLoad < bestLoad
            bestLoad = currentLoad;
            bestSol = currentSol;
            bestTime = toc(t);
        end
    end
    avObjective = aux / noCycles;
end