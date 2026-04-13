var num1 = 3;
var num2 = 2;
var nota = 7;
var salida = "";

if (num1 > num2) {
    console.log(num1 + " es mayor que " + num2);
} else {
    console.log(num1 + " es menor que " + num2);
}

for(num=1; num<=10; num++) {
    salida = salida + " 5 * " + num + " = " + 5*num + " ";
}

console.log(salida)

switch (nota) {
    case 6:
        console.log("Bien");
        break;

        case 7:
        case 8:
            console.log("Notable");
            break;
        case 9:
        case 10:
            console.log("Sobresaliente")
            break;
    default:
        console.log("Suspenso")
        break;
}

        num=1;

        salida = "";

        while (num<=10) {
            salida = salida + " 5 * " + num + " = " + 5*num + " ";
            num++;
        }
        console.log(salida)