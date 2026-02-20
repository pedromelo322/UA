#!/bin/bash

# Define o diretório de saída para os arquivos intermediários e logs
OUTPUT_DIR="output"
LOGS_DIR="logs"

# Garante que os diretórios de saída existam
mkdir -p "$OUTPUT_DIR"
mkdir -p "$LOGS_DIR"

echo "Iniciando testes para múltiplos arquivos model*.safetensors..."
echo "--------------------------------------------------------"

# Itera sobre todos os arquivos que correspondem ao padrão data/model*.safetensors
for INPUT_FILE in data/model*.safetensors; do
    # Verifica se encontrou algum arquivo (evita executar se o curinga não corresponder a nada)
    if [ ! -f "$INPUT_FILE" ]; then
        echo "Aviso: Nenhum arquivo correspondente a $INPUT_FILE encontrado. Pulando."
        continue
    fi

    # Extrai o nome base do arquivo (ex: model.safetensors, model_1.safetensors)
    FILENAME=$(basename -- "$INPUT_FILE")
    # Define o nome base sem a extensão .safetensors (ex: model, model_1)
    BASENAME="${FILENAME%.*}"

    echo "Processando: $FILENAME"
    echo "--------------------------------------------------------"
    
    # --- Teste de Codificação/Decodificação RÁPIDA (fast) ---
    LOG_FAST="$LOGS_DIR/${BASENAME}_fast_test.log"
    
    echo "  >> Modo: fast | Log: $LOG_FAST"
    
    {
        echo "=== Teste RÁPIDO (fast) para $FILENAME em $(date) ==="
        
        # 1. Mostrar tamanho original
        echo "Tamanho original:"
        ls -lh "$INPUT_FILE"
        ls -l "$INPUT_FILE"
        
        # 2. Codificação Rápida
        echo "--------------------------------------------------------"
        echo "Codificação em modo 'fast':"
        /usr/bin/time -v ./bin/encoder "$INPUT_FILE" "$OUTPUT_DIR/${BASENAME}.sc" fast
        
        # 3. Mostrar tamanho do arquivo codificado
        echo "Tamanho do arquivo codificado ($BASENAME.sc):"
        ls -lh "$OUTPUT_DIR/${BASENAME}.sc"
        ls -l "$OUTPUT_DIR/${BASENAME}.sc"
        
        # 4. Decodificação
        echo "--------------------------------------------------------"
        echo "Decodificação:"
        /usr/bin/time -v ./bin/decoder "$OUTPUT_DIR/${BASENAME}.sc" "$OUTPUT_DIR/${BASENAME}_restored_fast.safetensors"
        
        # 5. Mostrar tamanho do arquivo restaurado
        echo "Tamanho do arquivo restaurado (fast):"
        ls -lh "$OUTPUT_DIR/${BASENAME}_restored_fast.safetensors"
        ls -l "$OUTPUT_DIR/${BASENAME}_restored_fast.safetensors"
        
        # 6. Comparação de integridade (MD5)
        echo "--------------------------------------------------------"
        echo "Comparação MD5 (Original vs. Restaurado fast):"
        md5sum "$INPUT_FILE" "$OUTPUT_DIR/${BASENAME}_restored_fast.safetensors"
        
        # 7. Limpeza (opcional - comentar se quiser manter os arquivos intermediários)
        rm "$OUTPUT_DIR/${BASENAME}.sc" "$OUTPUT_DIR/${BASENAME}_restored_fast.safetensors"
        
        echo "=== Teste RÁPIDO (fast) CONCLUÍDO para $FILENAME ==="
        echo ""
    } > "$LOG_FAST" 2>&1
    
    echo "  >> OK. Resultados salvos em $LOG_FAST"
    
    # --- Teste de Codificação/Decodificação MELHOR (best) ---
    LOG_BEST="$LOGS_DIR/${BASENAME}_best_test.log"
    
    echo "  >> Modo: best | Log: $LOG_BEST"

    {
        echo "=== Teste MELHOR (best) para $FILENAME em $(date) ==="
        
        # 1. Mostrar tamanho original (repetido para consistência do log)
        echo "Tamanho original:"
        ls -lh "$INPUT_FILE"
        ls -l "$INPUT_FILE"
        
        # 2. Codificação Melhor
        echo "--------------------------------------------------------"
        echo "Codificação em modo 'best':"
        /usr/bin/time -v ./bin/encoder "$INPUT_FILE" "$OUTPUT_DIR/${BASENAME}.sc" best
        
        # 3. Mostrar tamanho do arquivo codificado
        echo "Tamanho do arquivo codificado ($BASENAME.sc):"
        ls -lh "$OUTPUT_DIR/${BASENAME}.sc"
        ls -l "$OUTPUT_DIR/${BASENAME}.sc"
        
        # 4. Decodificação
        echo "--------------------------------------------------------"
        echo "Decodificação:"
        /usr/bin/time -v ./bin/decoder "$OUTPUT_DIR/${BASENAME}.sc" "$OUTPUT_DIR/${BASENAME}_restored_best.safetensors"
        
        # 5. Mostrar tamanho do arquivo restaurado
        echo "Tamanho do arquivo restaurado (best):"
        ls -lh "$OUTPUT_DIR/${BASENAME}_restored_best.safetensors"
        ls -l "$OUTPUT_DIR/${BASENAME}_restored_best.safetensors"
        
        # 6. Comparação de integridade (MD5)
        echo "--------------------------------------------------------"
        echo "Comparação MD5 (Original vs. Restaurado best):"
        md5sum "$INPUT_FILE" "$OUTPUT_DIR/${BASENAME}_restored_best.safetensors"
        
        # 7. Limpeza (opcional)
        rm "$OUTPUT_DIR/${BASENAME}.sc" "$OUTPUT_DIR/${BASENAME}_restored_best.safetensors"
        
        echo "=== Teste MELHOR (best) CONCLUÍDO para $FILENAME ==="
        echo ""
    } > "$LOG_BEST" 2>&1
    
    echo "  >> OK. Resultados salvos em $LOG_BEST"
    echo "--------------------------------------------------------"

done

echo "Todos os testes foram concluídos."
echo "Os arquivos de log estão no diretório: $LOGS_DIR"