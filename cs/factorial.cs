using System;
using System.Diagnostics;
using System.IO;
using System.Numerics;

class Program {
    static void Main() {
        int n = 10000;
        Stopwatch stopwatch = Stopwatch.StartNew();

        BigInteger result = 1;
        for (int i = 2; i <= n; i++) {
            result *= i;
        }

        stopwatch.Stop();
        string output = $"Dígitos en {n}! : {result.ToString().Length}\n";
        output += $"Tiempo de ejecución: {stopwatch.ElapsedMilliseconds} ms";

        // Guardar en un archivo de texto
        File.WriteAllText("resultadoCS.txt", output);

        // También se puede imprimir en consola si se desea
        Console.WriteLine(output);
    }
}
