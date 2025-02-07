#!/bin/bash

RESULTS_FILE="benchmark_results.txt"
echo "Resultados del Benchmark:" > $RESULTS_FILE

# Ejecutar Python
echo "Entrando a la carpeta Python..."
cd py
docker build -t python-image .
EXEC_TIME_PY=$(docker run --rm python-image | awk '{print $NF}')
echo "Python: $EXEC_TIME_PY ms" >> ../$RESULTS_FILE
cd ..

# Ejecutar JavaScript
echo "Entrando a la carpeta JavaScript..."
cd js
docker build -t js-image .
EXEC_TIME_JS=$(docker run --rm js-image | awk '{print $NF}')
echo "JavaScript: $EXEC_TIME_JS ms" >> ../$RESULTS_FILE
cd ..

# Ejecutar Java
echo "Entrando a la carpeta Java..."
cd java
docker build -t java-image .
EXEC_TIME_JAVA=$(docker run --rm java-image | awk '{print $NF}')
echo "Java: $EXEC_TIME_JAVA ms" >> ../$RESULTS_FILE
cd ..

# Ejecutar C#
echo "Entrando a la carpeta C#..."
cd cs
docker build -t cs-image .
EXEC_TIME_CS=$(docker run --rm cs-image | awk '{print $NF}')
echo "C#: $EXEC_TIME_CS ms" >> ../$RESULTS_FILE
cd ..

# Ejecutar Ruby
echo "Entrando a la carpeta Ruby..."
cd ruby
docker build -t rb-image .
EXEC_TIME_RB=$(docker run --rm rb-image | awk '{print $NF}')
echo "Ruby: $EXEC_TIME_RB ms" >> ../$RESULTS_FILE
cd ..

# Ordenar los tiempos de ejecución de menor a mayor
echo "Resultados ordenados:" >> $RESULTS_FILE
sort -t: -k2 -n $RESULTS_FILE -o $RESULTS_FILE

# Mapear el archivo de resultados a un volumen en el contenedor
docker run --rm -v $(pwd)/$RESULTS_FILE:/benchmark_results.txt alpine cat /benchmark_results.txt

echo "Todos los scripts ejecutados. Resultados guardados en $RESULTS_FILE :)"
