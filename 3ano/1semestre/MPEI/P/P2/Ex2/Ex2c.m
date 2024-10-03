% Configurações
n_values = 10:10:100;  % Valores de n de 10 a 100 com incrementos de 10
m_values = [1000, 100000]; % Dois valores de m para comparar
N = 1e5;  % Número de simulações
prob_b_m1000 = zeros(length(n_values), 1);  % Probabilidades para m = 1000
prob_b_m100000 = zeros(length(n_values), 1); % Probabilidades para m = 100000

% Função para calcular a probabilidade de pelo menos 1 alvo ser atingido 2 ou mais vezes
for i = 1:length(m_values)
    m = m_values(i);
    
    for j = 1:length(n_values)
        n = n_values(j);
        
        % Simulação das tentativas
        tentativas = randi(m, n, N);
        colUnique = 0;
        
        for c = 1:N
            coluna = tentativas(:,c);
            if length(unique(coluna)) == n
                colUnique = colUnique + 1;
            end
        end
        
        % Probabilidade da alínea (b)
        probSimulacao_b = 1 - (colUnique / N);
        
        % Armazenar os resultados
        if m == 1000
            prob_b_m1000(j) = probSimulacao_b;
        elseif m == 100000
            prob_b_m100000(j) = probSimulacao_b;
        end
    end
end

% Gráfico com subplot
figure;

% Subgráfico para m = 1000
subplot(1, 2, 1);
plot(n_values, prob_b_m1000, '-o');
title('Probabilidade para m = 1000');
xlabel('Número de Dardos (n)');
ylabel('Probabilidade (pelo menos 1 alvo atingido 2 ou mais vezes)');
grid on;

% Subgráfico para m = 100000
subplot(1, 2, 2);
plot(n_values, prob_b_m100000, '-o');
title('Probabilidade para m = 100000');
xlabel('Número de Dardos (n)');
ylabel('Probabilidade (pelo menos 1 alvo atingido 2 ou mais vezes)');
grid on;

% Exibir a figura
sgtitle('Comparação de Probabilidade em Função de n para Diferentes Valores de m');
