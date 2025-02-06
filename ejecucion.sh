#!/bin/bash

# Ejecutar Python
echo "Entrando a la carpeta Python..."
cd py
docker build -t python-image .
EXEC_TIME_PY=$(docker run --rm python-image | awk '{print $NF}')
cd ..

# Ejecutar JavaScript
echo "Entrando a la carpeta JavaScript..."
cd js
docker build -t js-image .
EXEC_TIME_JS=$(docker run --rm js-image | awk '{print $NF}')
cd ..

# Ejecutar Java
echo "Entrando a la carpeta Java..."
cd java
docker build -t java-image .
EXEC_TIME_JAVA=$(docker run --rm java-image | awk '{print $NF}')
cd ..

# Ejecutar C#
echo "Entrando a la carpeta C#..."
cd cs
docker build -t cs-image .
EXEC_TIME_CS=$(docker run --rm cs-image | awk '{print $NF}')
cd ..

# Ejecutar C#
echo "Entrando a la carpeta Ruby..."
cd ruby
docker build -t rb-image .
EXEC_TIME_RB=$(docker run --rm rb-image | awk '{print $NF}')
cd ..

# Crear un array con los tiempos de ejecución
declare -A exec_times
exec_times["Python"]=$EXEC_TIME_PY
exec_times["JavaScript"]=$EXEC_TIME_JS
exec_times["Java"]=$EXEC_TIME_JAVA
exec_times["C#"]=$EXEC_TIME_CS
exec_times["Ruby"]=$EXEC_TIME_RB

# Ordenar los tiempos de ejecución de menor a mayor
for lang in "${!exec_times[@]}"; do
  echo "$lang: ${exec_times[$lang]} ms"
done | sort -t: -k2 -n

echo "Todos los scripts ejecutados. :)" 
