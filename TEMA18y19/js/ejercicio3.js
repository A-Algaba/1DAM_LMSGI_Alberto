var letras = [
    "T", "R", "W", "A", "G", "M", "Y", "F", "P", "D",
    "D", "X", "B", "N", "J", "Z", "S", "Q", "V", "H", "L",
    "C", "K", "E"
];

var numero = prompt("Numero de DNI (sin la letra)")

if (numero < 0 || numero > 99999999) {
    alert("El numero proporcionado no es valido");
} else {
    var letraCalculada = letras[numero % 23]
}

alert("El DNI completo es: " + numero + letraCalculada);