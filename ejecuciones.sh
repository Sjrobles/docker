#!/bin/bash

# Ejecutar Python
echo "Entrando a la carpeta Python..."
cd py
docker build -t python-image .
docker run --rm python-image
PYTHON_TIME=$(grep -oP 'Tiempo de ejecución: \K\d+' resultado_python.txt)
cd ..

# Ejecutar JavaScript
echo "Entrando a la carpeta JavaScript..."
cd js
docker build -t js-image .
docker run --rm js-image
JS_TIME=$(grep -oP 'Tiempo de ejecución: \K\d+' resultado_js.txt)
cd ..

# Ejecutar Java
echo "Entrando a la carpeta Java..."
cd java
docker build -t java-image .
docker run --rm java-image
JAVA_TIME=$(grep -oP 'Tiempo de ejecución: \K\d+' resultado_java.txt)
cd ..

# Ejecutar C#
echo "Entrando a la carpeta C#..."
cd cs
docker build -t cs-image .
docker run --rm cs-image
CS_TIME=$(grep -oP 'Tiempo de ejecución: \K\d+' resultado_cs.txt)
cd ..

# Mostrar los resultados ordenados
echo "Ordenando por tiempo de ejecución..."

# Crear un array con los tiempos y lenguajes
declare -A LANGUAGES
LANGUAGES["Python"]=$PYTHON_TIME
LANGUAGES["JavaScript"]=$JS_TIME
LANGUAGES["Java"]=$JAVA_TIME
LANGUAGES["C#"]=$CS_TIME

# Ordenar y mostrar los resultados
for lang in $(for lang in "${!LANGUAGES[@]}"; do echo "$lang ${LANGUAGES[$lang]}"; done | sort -k2 -n | cut -d' ' -f1); do
    echo "$lang: ${LANGUAGES[$lang]} ms"
done

echo "Todos los scripts ejecutados y ordenados por duración."
