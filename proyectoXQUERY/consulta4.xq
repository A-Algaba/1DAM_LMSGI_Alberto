xquery version "1.0";

(:Consulta4: Alberto Algaba Calderón:)

<html>
  <head>
    <meta charset="UTF-8"/>
    <title>Jugadores de Francia</title>
    <style>
      body {{ font-family: Arial, sans-serif; padding: 20px; }}
      h1 {{
        text-align: center;
        color: #00008B;
        border: 2px solid #00008B;
        padding: 15px;
      }}
      ul {{ list-style-type: disc; padding-left: 40px; }}
      li {{ margin: 5px 0; }}
    </style>
  </head>
  <body>
    <h1>Jugadores de Francia</h1>
    <ul>
    {
      for $jugador in doc("jugadores.xml")//jugador
      where $jugador/pais = "Francia"
      order by $jugador/nombreCompleto
      return
        <li>{$jugador/nombreCompleto/text()} - {$jugador/posicion/text()} - {$jugador/equipoActual/text()}</li>
    }
    </ul>
  </body>
</html>