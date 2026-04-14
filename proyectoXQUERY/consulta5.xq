xquery version "1.0";

(:Consulta5: Alberto Algaba Calderón:)

<jugadores_espana>
{
  for $j in doc("jugadores.xml")/jugadores/jugador
  where $j/pais = "España"
  return
    <jugador cod="{data($j/@cod)}">
      <nombreCompleto>{$j/nombreCompleto/text()}</nombreCompleto>
      <nacimiento>{$j/nacimiento/text()}</nacimiento>
      <categoria>{
        if ($j/nacimiento < 1995)
        then "veterano"
        else "activo"
      }</categoria>
    </jugador>
}
</jugadores_espana>