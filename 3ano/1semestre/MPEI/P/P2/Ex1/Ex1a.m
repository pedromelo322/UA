N= 1e5;
p = 0.5; %probabilidade de rapaz
k = 1; %núumero de rapazes
n = 2; %número de filhos
rapaz = rand(n,N) > p;
sucessos= sum(rapaz)>=k;
probSimulacao= sum(sucessos)/N