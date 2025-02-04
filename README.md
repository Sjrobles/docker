
### Descripción de cada carpeta:

- **py/**: Contiene el script de Python (`factorial.py`) y su respectivo `Dockerfile` para construir la imagen de Docker.
- **js/**: Contiene el script de JavaScript (`factorial.js`) y su `Dockerfile`.
- **java/**: Contiene el script de Java (`factorial.java`) y su `Dockerfile`.
- **cs/**: Contiene el script de C# (`factorial.cs`) y su `Dockerfile`.
- - **cpp/**: Contiene el script de C# (`factorial.cpp`) y su `Dockerfile`.

### Archivos de salida:

- **`resultado_python.txt`**, **`resultado_js.txt`**, **`resultado_java.txt`**, **`resultado_cs.txt`**,**`resultado_c++.txt`**: Archivos donde se almacenan los resultados de la ejecución de cada script, incluyendo el tiempo de ejecución.

## Funcionalidad

1. **Scripts individuales**:
    - Cada script implementa un cálculo del factorial de un número grande (por defecto `10000`) y mide el tiempo de ejecución.
    - El resultado incluye el número de dígitos del factorial calculado y el tiempo de ejecución.
  
2. **Dockerfiles**:
    - Cada lenguaje tiene su propio `Dockerfile` que construye una imagen con el entorno adecuado para ejecutar el script de factorial en su respectivo lenguaje.
    - El contenedor se construye, se ejecuta el script y luego se elimina el contenedor una vez que se ha completado la ejecución.

3. **Script Bash (`ejecucion.sh`)**:
    - **Automatización**: El script Bash automatiza el proceso de construcción de las imágenes Docker y ejecución de los contenedores para cada uno de los lenguajes.
    - **Proceso**:
        - Entra en cada carpeta, construye la imagen Docker y ejecuta el contenedor.
        - Copia el archivo de resultados de cada lenguaje a la raíz del proyecto.
        - Finalmente, ordena los lenguajes según el tiempo de ejecución (de menor a mayor) y muestra los resultados ordenados.
    - **Permisos de ejecución**: El script tiene permisos de ejecución (`chmod +x`), por lo que no es necesario cambiar manualmente los permisos para correrlo.


## Instrucciones para ejecutar el proyecto

1. **Clonar el repositorio**:

    ```bash
    git clone https://github.com/Sjrobles/docker.git
    cd docker
    ```

2. **Hacer ejecutable el script Bash**:

    ```bash
    chmod +x ejecucion.sh
    ```

3. **Ejecutar el script**:

    ```bash
    ./ejecucion.sh
    ```

4. **Resultados**:
    - El script ejecutará cada uno de los lenguajes y mostrará en la consola los resultados ordenados por tiempo de ejecución.
    - Los tiempos de ejecución también se guardarán en los archivos `resultado_python.txt`, `resultado_js.txt`, `resultado_java.txt`, `resultado_c++.txt`, y `resultado_cs.txt`.


