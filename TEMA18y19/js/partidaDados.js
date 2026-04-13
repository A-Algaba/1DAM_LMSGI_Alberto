var dado1, dado2;
var punt1=0;
var punt2=0;

document.write("<h1>Partida de DADOS</h1>");
document.write("<table><tr><th>Jugador1</th>" + "<th>Jugador2</th></tr>");

for (i = 1; i <= 10; i++) {
    document.write("<tr>");
    dado1=Math.floor(Math.random() * (7 - 1)) + 1;
    dado2=Math.floor(Math.random() * (7 - 1)) + 1;
    document.write("<td>" + dado1 + "</td>");
    document.write("<td>" + dado2 + "</td>");
    document.write("</tr>");

    if (dado1>dado2) {

        punt1=punt1+1;

    } else if (dado<dado2) {

        punt2=punt2+1;

    }
    
}

document.write("</table>");
document.write("<br>");
document.write("<div>");
document.write("<h2>Puntucacion total</h2>");

document.write("JUGADOR1: " + punt1 + " puntos.<br>");
document.write("JUGADOR2: " + punt2 + " puntos.<br>");

if (punt1 > punt2) {
    document.write("<h2>Jugador 1 gana</h2>")
} else {

    if (punt1 == punt2) {
    document.write("<h2>EMPATE</h2>");
} else {
    document.write("<h2>Jugador 2 gana</h2>");
}

}

document.write("</div>");