xquery version "1.0" encoding "utf-8";

<html>
   <head>
    <tittle>Listado de coches diesel</tittle>
    <style>
    
    body
    &#123;
    font-family: Verdana;
    &#125;
    div
    &#123;
    border: solid 3px;
    width: 300px;
    text-align: center;
    color: blue;
    margin: 10px;
    &#125;
    
    </style>
  </head>
  <body>
  
  <div><h1>Listado de coches disesel</h1></div>
  
  <ul>
      {
        for $x in doc("concesionario.xml")//coche
        let $m:="Matricula: "
        where $x/combustible="Diesel"
        order by $x/@matricula descending
        return <li><b>{$m}</b> {string($x/@matricula)}</li>
      }
  </ul>
  
  </body>
</html>