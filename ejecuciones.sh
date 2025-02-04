#!/bin/bash

# Ejecutar Python
echo "Entrando a la carpeta Python..."
cd py
docker build -t python-image .
docker run --rm python-image
cd ..

# Ejecutar JavaScript
echo "Entrando a la carpeta JavaScript..."
cd js
docker build -t js-image .
docker run --rm js-image
cd ..

# Ejecutar Java
echo "Entrando a la carpeta Java..."
cd java
docker build -t java-image .
docker run --rm java-image
cd ..

# Ejecutar C#
echo "Entrando a la carpeta C#..."
cd cs
docker build -t cs-image .
docker run --rm cs-image
cd ..

echo "Todos los scripts ejecutados. :)"
