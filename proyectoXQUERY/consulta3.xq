xquery version "1.0";

(:Consulta3: Alberto Algaba Calderón:)

declare function local:jugadoresPorEquipo($equipo as xs:string) {
  for $j in doc("jugadores.xml")/jugadores/jugador
  where $j/equipoActual = $equipo
  return
    <nombre>{data($j/@cod)} -- {$j/nombreCompleto/text()}</nombre>
};

local:jugadoresPorEquipo("Liverpool FC")