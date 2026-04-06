xquery version "1.0" encoding "utf-8";

for $x at $i in //coche (:El elemento coche se guarda en la variable $x:)
return <coche>{$i} .- {$x/marca/text()} </coche>,

for $x in (10 to 12)
return <numeros> {$x}</numeros>,

for $x in (5), $y in (1,2,3)
return <tabla> {$x}*{$y}={$x*$y}</tabla>,

for $x in //coche
where $x/combustible="Gasolina"
return $x/@matricula