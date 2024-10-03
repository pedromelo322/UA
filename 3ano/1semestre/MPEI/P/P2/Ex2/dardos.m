function probSimulacao = dardos(n, m, N)
    % n: número de dardos
    % m: número de alvos
    % N: número de simulações
    
    % Simulação das tentativas
    tentativas = randi(m, n, N);

    colUnique = 0;
    for c = 1:N
        coluna = tentativas(:,c);
        if length(unique(coluna)) == n
            colUnique = colUnique + 1;
        end
    end

    % Probabilidade de nenhum alvo ser atingido mais de uma vez
    probSimulacao = colUnique / N;
end