%Resolução do A

%P_erroCarlos = (0.001*50)/100;
%P_erro = (20*0.01 + 30*0.05 + 0.001 * 50) / 100;

%probA = P_erroCarlos / P_erro


N = 1e5; 
progAndre = 20; 
progBruno = 30; 
progCarlos = 50; 


erro_andre = rand(progAndre, N) < 0.01;
erro_bruno = rand(progBruno, N) < 0.05;
erro_carlos = rand(progCarlos, N) < 0.001;


matrix = [erro_andre; erro_bruno; erro_carlos];

total_erros = sum(matrix, 1);


contagem_carlos = 0;
contagem_andre = 0;
contagem_bruno = 0;


for c = 1:N
    programas = matrix(:, c);
    
    
    if any(programas)
        
        [index, v] = find(programas == 1);
        
        
        if length(index) > 0
            x = randperm(length(index)); 
            res = index(x(1));

            if res <= progAndre
                contagem_andre = contagem_andre + 1;
            elseif res <= progAndre + progBruno
                contagem_bruno = contagem_bruno + 1;
            else
                contagem_carlos = contagem_carlos + 1;
            end
        end
    end
end

% Calculando as probabilidades
total_selecionados = contagem_andre + contagem_bruno + contagem_carlos;
P_carlos = contagem_carlos / total_selecionados;
P_andre = contagem_andre / total_selecionados;
P_bruno = contagem_bruno / total_selecionados;

% Exibindo os resultados
fprintf('Probabilidade de o programa ser de Carlos, dado que contém um erro: %.4f (%.2f%%)\n', ...
        P_carlos, P_carlos * 100);
