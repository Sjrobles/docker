#!/bin/sh

SOLUTIONS_DIR="docker"
LANGUAGES="cs java js py"

declare -A TIMES

echo "===== Construyendo y ejecutando los contenedores ====="

for lang in $LANGUAGES; do
    echo "Construyendo y ejecutando $lang"
    cd "$lang" || continue

    # Construir la imagen
    docker build -t "${lang}_solution" .

    # Capturar tiempo de ejecución en milisegundos
    START_TIME=$(date +%s%3N)
    docker run --rm "${lang}_solution"
    END_TIME=$(date +%s%3N)
    
    # Calcular tiempo total
    EXEC_TIME=$((END_TIME - START_TIME))
    TIMES[$lang]=$EXEC_TIME

    cd ..

done

echo "===== Resultados ordenados por tiempo de ejecución ====="
for lang in $(printf "%s\n" "${!TIMES[@]}" | sort -n -k2 -t= <<< "${!TIMES[@]}=${TIMES[@]}"); do
    echo "$lang: ${TIMES[$lang]} ms"
done
