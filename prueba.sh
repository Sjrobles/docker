#!/bin/bash

# Ejecutar Python
echo "Entrando a la carpeta Python..."
cd py
docker build -t python-image .
EXEC_TIME_PY=$(docker run --rm python-image | awk '{print $NF}')
echo "Tiempo de ejecución de Python: $EXEC_TIME_PY ms"
cd ..

# Ejecutar JavaScript
echo "Entrando a la carpeta JavaScript..."
cd js
docker build -t js-image .
EXEC_TIME_JS=$(docker run --rm js-image | awk '{print $NF}')
echo "Tiempo de ejecución de JavaScript: $EXEC_TIME_JS ns"
cd ..

# Ejecutar Java
echo "Entrando a la carpeta Java..."
cd java
docker build -t java-image .
EXEC_TIME_JAVA=$(docker run --rm java-image | awk '{print $NF}')
echo "Tiempo de ejecución de Java: $EXEC_TIME_JAVA ms"
cd ..

# Ejecutar C#
echo "Entrando a la carpeta C#..."
cd cs
docker build -t cs-image .
EXEC_TIME_CS=$(docker run --rm cs-image | awk '{print $NF}')
echo "Tiempo de ejecución de C#: $EXEC_TIME_CS ms"
cd ..

echo "Todos los scripts ejecutados. :)"
