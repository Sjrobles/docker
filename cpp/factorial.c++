#include <iostream>
#include <vector>
#include <chrono>
#include <fstream>

using namespace std;
using namespace chrono;

void factorial(int n) {
    vector<int> result = {1}; // Inicializa con 1

    for (int i = 2; i <= n; i++) {
        int carry = 0;
        for (size_t j = 0; j < result.size(); j++) {
            int prod = result[j] * i + carry;
            result[j] = prod % 10;
            carry = prod / 10;
        }
        while (carry) {
            result.push_back(carry % 10);
            carry /= 10;
        }
    }

    // Guardar resultado en archivo
    ofstream output_file("resultado.txt");
    if (output_file.is_open()) {
        output_file << "Dígitos en " << n << "! : " << result.size() << endl;
    }
    output_file.close();
}

int main() {
    int n = 10000;
    auto start = high_resolution_clock::now();

    factorial(n);

    auto end = high_resolution_clock::now();
    long long exec_time = duration_cast<milliseconds>(end - start).count();

    // Guardar tiempo de ejecución en archivo
    ofstream output_file("resultadoCPP.txt", ios::app); // Abrir en modo append
    if (output_file.is_open()) {
        output_file << "Tiempo de ejecución: " << exec_time << " ms" << endl;
    }
    output_file.close();

    // También imprimir en consola
    cout << "Tiempo de ejecución: " << exec_time << " ms" << endl;

    return 0;
}
