function Loads= calcLinkLoads(nNodes,Links,T,sP,Solution)
% Loads= calcLinkLoads(nNodes,Links,T,sP,Solution)
% INPUT:
%   nNodes   - number of nodes of the network
%   Links    - matrix with the links of the network
%   T        - matrix with the traffic flows
%   sP       - cell array with the candidate routing paths of each flow
%   Solution - vector with the selected routing path index for each flow
% OUTPUT:
%   Loads - matrix with 4 columns, the 2 first columns equal to Links and
%           the 2 last columns with the link load on each direction of the links 

    nFlows= size(T,1);     % no. of flows equal to the no. of rows of matrix T
    nLinks= size(Links,1); % no. of links equal to the no. of rows of matrix Links
    aux= zeros(nNodes);
    for i= 1:nFlows
        if Solution(i)>0
            path= sP{i}{Solution(i)};
            for j=2:length(path)
                aux(path(j-1),path(j))= aux(path(j-1),path(j)) + T(i,3); 
                aux(path(j),path(j-1))= aux(path(j),path(j-1)) + T(i,4);
            end
        end
    end
    Loads= [Links zeros(nLinks,2)];
    for i= 1:nLinks
        Loads(i,3)= aux(Loads(i,1),Loads(i,2));
        Loads(i,4)= aux(Loads(i,2),Loads(i,1));
    end
end