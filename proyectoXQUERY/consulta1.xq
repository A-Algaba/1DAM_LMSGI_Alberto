xquery version "1.0";

(:Consulta1: Alberto Algaba Calderón:)

let $jugadores := doc("jugadores.xml")//jugador

for $j in $jugadores
order by $j/equipoActual ascending
return
  <jugador>{$j/nombreCompleto/text()} -- {$j/equipoActual/text()} -- {substring($j/posicion/text(), 1, 3)}</jugador>