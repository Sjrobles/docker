def factorial(n)
  result = 1
  (2..n).each do |i|
    result *= i
  end
  result
end

n = 10000
start_time = Time.now # Obtener el tiempo de inicio

# Calcular el factorial
factorial(n)

end_time = Time.now # Obtener el tiempo de finalización
execution_time = (end_time - start_time) * 1000 # Convertir a milisegundos

# Guardar en un archivo de texto
file_path = "resultadoRuby.txt"
File.open(file_path, 'w') do |file|
  file.write(format('%.2f', execution_time))
end

# Imprimir también en consola
puts format('%.2f', execution_time)
