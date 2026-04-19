xquery version "1.0";

(:Consulta 11: Alberto Algaba Calderón:)

for $jugador in //jugador
for $equipo in doc("equipos.xml")//equipo
where $jugador/equipoActual = $equipo/nombre
return
  <jugador>
    <nombre>{$jugador/nombreCompleto/text()}</nombre>
    <equipo>{$equipo/nombre/text()}</equipo>
    <pais_equipo>{$equipo/pais/text()}</pais_equipo>
    <liga>{$equipo/liga/text()}</liga>
  </jugador>