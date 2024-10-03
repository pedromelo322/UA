N= 1e5;
p = 0.5; %probabilidade de rapaz
k = 1; %núumero de rapazes
n = 2; %número de filhos
rapaz = rand(n,N) > p;
familia_com_dois_rapazes= sum(rapaz) == 2;
familia_com_um_ou_mais_rapazes= sum(rapaz) >= k;
probSimulacao = sum(familia_com_dois_rapazes)/ sum(familia_com_um_ou_mais_rapazes)
