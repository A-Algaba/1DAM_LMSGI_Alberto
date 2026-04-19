xquery version "1.0";

(:Consulta 7: Alberto Algaba Calderón:)

for $pais in //pais
return rename node $pais as "nacionalidad"