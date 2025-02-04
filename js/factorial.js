const fs = require('fs');

console.time("Tiempo de ejecución");

function factorial(n) {
    let result = BigInt(1);
    for (let i = 2; i <= n; i++) {
        result *= BigInt(i);
    }
    return result;
}

const n = 10000;
const result = factorial(n);

console.timeEnd("Tiempo de ejecución");

// Guardar los resultados en un archivo
fs.appendFileSync('resultadoJS.txt', `Tiempo de ejecución: ${process.hrtime.bigint()} ns\n`, 'utf8');
