function [bSol,bObjective,noCycles,avObjective,bTime] = RandomAlgorithm(nNodes,Links,T,sP,nSP,timeLimit)
% [bSol,bObjective,noCycles,avObjective,bTime] = RandomAlgorithm(nNodes,Links,T,sP,nSP,timeLimit)
% INPUT:
%   nNodes    - number of nodes of the network
%   Links     - matrix with the links of the network
%   T         - matrix with the traffic flows
%   sP        - cell array with the candidate routing paths of each flow
%   nSP       - row vector with the number of candidate routing paths of each flow
%   timeLimit - runtime limit of the algorithm
% OUTPUT:
%   bSol        - vector with the selected routing path index for each flow
%   bObjective  - worst link load of the best solution
%   noCycles    - number of cycles run by the algorithm with the runtime limit
%   avObjective - average worst link load value among all generated solutions
%   bTime       - runtime at which the algorithm found the best solution
    t= tic;
    nFlows= size(T,1);  % no. of flows equal to the no. of rows of matrix T
    bObjective= inf;
    noCycles= 0;
    aux= 0;
    while toc(t) < timeLimit
        sol= RandomSelection(nFlows,nSP);  % Build a solution with the random strategy
        Loads= calcLinkLoads(nNodes,Links,T,sP,sol);
        load= max(max(Loads(:,3:4)));
        noCycles= noCycles+1;
        aux= aux+load;
        if load<bObjective
            bSol= sol;
            bObjective= load;
            bTime= toc(t);
        end
    end
    avObjective= aux/noCycles;
end

function sol= RandomSelection(nFlows,nSP)
    sol= zeros(1,nFlows);
    for f= 1:nFlows
        % for flow f, a candidate routing path is selected at random:
        sol(f)= randi(nSP(f));
    end
end