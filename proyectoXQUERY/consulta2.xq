xquery version "1.0";

(:Consulta2: Alberto Algaba Calderón:)

<resultado>
{

let $jugadores := doc("jugadores.xml")//jugador[nacimiento < 1990]

return
(<total>{count($jugadores)}</total>,
for $i at $j in $jugadores
return <nombre>{$j} .- {data($i/nombreCompleto)}</nombre>)
}

</resultado>