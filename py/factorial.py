import time

def factorial(n):
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

n = 10000
start_time = time.time()

# Calcular el factorial
factorial(n)

end_time = time.time()
execution_time = (end_time - start_time) * 1000  # Convertir a milisegundos

# Guardar en un archivo de texto
with open("resultadoPY.txt", "w") as file:
    
    file.write(f"Tiempo de ejecución: {execution_time:.2f} ms\n")

# Imprimir también en consola
print(f"Tiempo de ejecución: {execution_time:.2f} ms")
