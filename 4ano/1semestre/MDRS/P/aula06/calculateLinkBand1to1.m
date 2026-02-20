function Loads= calculateLinkBand1to1(nNodes,Links,T,sP,Solution)
    nFlows= size(T,1);
    nLinks= size(Links,1);
    aux= zeros(nNodes);
    for i= 1:nFlows
        if Solution(i)>0
            path= sP{1,i}{Solution(i)};
            for j=2:length(path)
                aux(path(j-1),path(j))= aux(path(j-1),path(j)) + T(i,3); 
                aux(path(j),path(j-1))= aux(path(j),path(j-1)) + T(i,4);
            end
        end
    end
    for link= 1:nLinks     % for each link failure
        aux2= zeros(nNodes);
        t1= Links(link,1);
        t2= Links(link,2);
        for i= 1:nFlows
            if Solution(i)>0
                path= sP{1,i}{Solution(i)};
                pathdif= find(path==t1 | path==t2);
                if length(pathdif)<2 || pathdif(2)-pathdif(1)>1  % if the failed link is not in the working path
                    for j=2:length(path)                         % flow is routed through the working path
                        aux2(path(j-1),path(j))= aux2(path(j-1),path(j)) + T(i,3); 
                        aux2(path(j),path(j-1))= aux2(path(j),path(j-1)) + T(i,4);
                    end
                elseif ~isempty(sP{2,i})               % if the failed link is in the working path and the backup path exists
                    path= sP{2,i}{Solution(i)};        % flow is routed thorough the backup path 
                    for j=2:length(path)
                        aux2(path(j-1),path(j))= aux2(path(j-1),path(j)) + T(i,3); 
                        aux2(path(j),path(j-1))= aux2(path(j),path(j-1)) + T(i,4);
                    end
                end
            end
        end
        aux=max(aux,aux2); % the bandwidth required at each of the links is updated with the highest value
    end
    Loads= [Links zeros(nLinks,2)];
    for i= 1:nLinks
        Loads(i,3)= aux(Loads(i,1),Loads(i,2));
        Loads(i,4)= aux(Loads(i,2),Loads(i,1));
    end
end