# A CODECO CASE STUDY AND INITIAL VALIDATION FOR EDGE ORCHESTRATION OF AUTONOMOUS MOBILE ROBOTS

Não li, fora de scope na minha opinião.
Faz uma comparação entre CODECO e Kubernetes.

Resultados:

- **CPU**: O CODECO consome menos CPU, aproximadamente metade
- **Memória**: O CODECO tem cerca de 10–15% de overhead (ex.: 63 vs. 54 MiB)
- **Taxas de dados**: O CODECO produz tráfego mais baixo e estável; o Kubernetes tem picos acima de 2–3 Gbps
- **Ciclo de vida dos pods**: O Kubernetes é mais rápido (~2 s vs. ~5 s) devido à inicialização do overlay L2S-M

Não foram aplicados mecanimos TSN.
