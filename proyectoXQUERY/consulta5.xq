xquery version "1.0";

(:Consulta5: Alberto Algaba Calderón:)

<jugadores_espana>
{
  for $jugador in doc("jugadores.xml")//jugador
  where $jugador/pais = "España"
  return
    <jugador cod="{data($jugador/@cod)}">
      <nombreCompleto>{$jugador/nombreCompleto/text()}</nombreCompleto>
      <nacimiento>{$jugador/nacimiento/text()}</nacimiento>
      <categoria>{
        if ($jugador/nacimiento < 1995)
        then "veterano"
        else "activo"
      }</categoria>
    </jugador>
}
</jugadores_espana>