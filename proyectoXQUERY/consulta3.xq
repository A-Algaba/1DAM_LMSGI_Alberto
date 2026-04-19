xquery version "1.0";

(:Consulta3: Alberto Algaba Calderón:)

declare function local:jugadoresPorEquipo($equipo as xs:string) {
  for $jugador in doc("jugadores.xml")//jugador
  where $jugador/equipoActual = $equipo
  return
    <nombre>{data($jugador/@cod)} -- {$jugador/nombreCompleto/text()}</nombre>
};

local:jugadoresPorEquipo("Liverpool FC")