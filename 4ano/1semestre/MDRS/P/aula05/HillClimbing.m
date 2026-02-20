function [sol, load] = HillClimbing(nNodes, Links, T, sP, nSP, sol, load)
    nFlows = length(sol);
    improved = true;
    
    while improved
        improved = false;
        % Tenta melhorar mudando o caminho de cada fluxo
        for f = 1:nFlows
            currentPath = sol(f);
            % Testa todos os outros caminhos possíveis para o fluxo f
            for p = 1:nSP(f)
                if p ~= currentPath
                    newSol = sol;
                    newSol(f) = p;
                    
                    newLoads = calcLinkLoads(nNodes, Links, T, sP, newSol);
                    newMaxLoad = max(max(newLoads(:, 3:4)));
                    
                    if newMaxLoad < load
                        sol = newSol;
                        load = newMaxLoad;
                        improved = true;
                    end
                end
            end
        end
    end
end