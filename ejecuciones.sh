#!/bin/bash

# Ejecutar Python
echo "Entrando a la carpeta Python..."
cd py
docker build -t python-image .
docker run --rm python-image
cp resultado_python.txt ../resultado_python.txt  # Copiar el resultado a la raíz
cd ..

# Ejecutar JavaScript
echo "Entrando a la carpeta JavaScript..."
cd js
docker build -t js-image .
docker run --rm js-image
cp resultado_js.txt ../resultado_js.txt  # Copiar el resultado a la raíz
cd ..

# Ejecutar Java
echo "Entrando a la carpeta Java..."
cd java
docker build -t java-image .
docker run --rm java-image
cp resultado_java.txt ../resultado_java.txt  # Copiar el resultado a la raíz
cd ..

# Ejecutar C#
echo "Entrando a la carpeta C#..."
cd cs
docker build -t cs-image .
docker run --rm cs-image
cp resultado_cs.txt ../resultado_cs.txt  # Copiar el resultado a la raíz
cd ..

# Ordenar los resultados por tiempo de ejecución
echo "Ordenando por tiempo de ejecución..."

# Crear un array con los resultados y tiempos
declare -A RESULTS

# Leer los archivos de resultados y almacenarlos en el array
RESULTS["Python"]=$(cat resultado_python.txt)
RESULTS["JavaScript"]=$(cat resultado_js.txt)
RESULTS["Java"]=$(cat resultado_java.txt)
RESULTS["C#"]=$(cat resultado_cs.txt)

# Ordenar los resultados por el tiempo de ejecución (se asume que los tiempos están al final de cada archivo)
for lang in "${!RESULTS[@]}"; do
    # Extraer solo la línea con el tiempo (se asume que la última línea contiene "Tiempo de ejecución")
    TIME=$(echo "${RESULTS[$lang]}" | grep -oP 'Tiempo de ejecución: \K.*')
    LANG_TIMES+=("$TIME $lang")
done

# Mostrar los resultados ordenados
for result in $(echo "${LANG_TIMES[@]}" | sort -n); do
    echo "$result"
done

echo "Todos los scripts ejecutados y ordenados por duración."
