const fs = require('fs');

const start = process.hrtime.bigint();
function factorial(n) {
    let result = BigInt(1);
    for (let i = 2; i <= n; i++) {
        result *= BigInt(i);
    }
    return result;
}
const n = 10000;
factorial(n);
const end = process.hrtime.bigint();

// Convertir a milisegundos
const executionTime = Number(end - start) / 1e6;

console.log(`Tiempo de ejecución: ${executionTime.toFixed(2)}`);
fs.appendFileSync('resultadoJS.txt', `Tiempo de ejecución: ${executionTime.toFixed(2)} ms\n`, 'utf8');
