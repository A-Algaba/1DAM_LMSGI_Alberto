xquery version "1.0" encoding "utf-8";

<html>
  <head>
  <tittle>Listado de coches segun su tipo de combustible</tittle>
  </head>
  <body>
    <ul>
    {
      
      for $x in //coche
      let $y:=$x/combustible
      where $x/precio>22000
      order by $x/marca descending
      return <li>{$x/marca/text()} -- {substring($y,1,3)}</li>
      
    }
   </ul>
  </body>
</html>