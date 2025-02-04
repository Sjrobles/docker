import java.math.BigInteger;
import java.io.FileWriter;
import java.io.IOException;

public class Factorial {
    public static void main(String[] args) {
        int n = 10000;
        long startTime = System.currentTimeMillis();

        // Llamada a la función que calcula el factorial
        BigInteger result = factorial(n);

        long endTime = System.currentTimeMillis();
        long execTime = endTime - startTime;

        // Guardar el resultado en un archivo
        try (FileWriter writer = new FileWriter("resultadoJava.txt", true)) { // Abrir en modo append
            writer.write("Tiempo de ejecución: " + execTime + " ms\n");
        } catch (IOException e) {
            System.out.println("Error al escribir en el archivo.");
            e.printStackTrace();
        }

        // Imprimir el tiempo de ejecución
        System.out.println("Tiempo de ejecución: " + execTime + " ms");
    }

    public static BigInteger factorial(int n) {
        BigInteger result = BigInteger.ONE;
        for (int i = 2; i <= n; i++) {
            result = result.multiply(BigInteger.valueOf(i));
        }
        return result;
    }
}
