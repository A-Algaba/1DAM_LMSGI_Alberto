<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- ============================================================
       TEMPLATE RAIZ: genera el esqueleto HTML completo
  ============================================================ -->
  <xsl:template match="/">
    <xsl:element name="html">
      <xsl:element name="head">
        <xsl:element name="meta">
          <xsl:attribute name="charset">UTF-8</xsl:attribute>
        </xsl:element>
        <xsl:element name="title">
          <xsl:value-of select="catalogo/titulo"/>
        </xsl:element>
        <style>
          body { font-family: Arial, sans-serif; margin: 30px; background: #f5f5f5; color: #333; }
          h1   { color: #1a1a2e; border-bottom: 3px solid #e94560; padding-bottom: 8px; }
          h2   { color: #16213e; margin-top: 40px; }
          .empresa { background: #fff; padding: 12px 20px; border-left: 5px solid #e94560;
                     margin-bottom: 30px; border-radius: 4px; }
          table { width: 100%; border-collapse: collapse; background: #fff;
                  margin-bottom: 30px; border-radius: 6px; overflow: hidden;
                  box-shadow: 0 2px 6px rgba(0,0,0,0.1); }
          th    { background: #16213e; color: #fff; padding: 10px 14px; text-align: left; }
          td    { padding: 9px 14px; border-bottom: 1px solid #eee; vertical-align: top; }
          tr:last-child td { border-bottom: none; }
          tr:hover td { background: #f0f4ff; }
          .stock-bajo  { color: #c0392b; font-weight: bold; }
          .val-alto    { color: #27ae60; font-weight: bold; }
          .val-medio   { color: #e67e22; font-weight: bold; }
          .val-bajo    { color: #c0392b; font-weight: bold; }
          .badge-stock { font-size: 0.78em; background: #ffe0e0; color: #c0392b;
                         padding: 2px 7px; border-radius: 10px; margin-left: 6px; }
          footer { margin-top: 40px; font-size: 0.85em; color: #888; text-align: center; }
        </style>
      </xsl:element>

      <xsl:element name="body">

        <!-- TÍTULO PRINCIPAL -->
        <xsl:element name="h1">
          <xsl:value-of select="catalogo/titulo"/>
        </xsl:element>

        <!-- DATOS DE LA EMPRESA -->
        <xsl:element name="div">
          <xsl:attribute name="class">empresa</xsl:attribute>
          <strong>Empresa: </strong><xsl:value-of select="catalogo/empresa/nombre"/>
          &#160;|&#160;
          <strong>Web: </strong><xsl:value-of select="catalogo/empresa/web"/>
          &#160;|&#160;
          <strong>Tel: </strong><xsl:value-of select="catalogo/empresa/telefono"/>
          &#160;|&#160;
          <strong>Fecha: </strong><xsl:value-of select="catalogo/fecha"/>
        </xsl:element>

        <!-- RECORREMOS CADA CATEGORÍA -->
        <xsl:for-each select="catalogo/categoria">

          <!-- Título de sección con el atributo @nombre de la categoría -->
          <xsl:element name="h2">
            <xsl:value-of select="@nombre"/>
          </xsl:element>

          <xsl:element name="table">
            <xsl:element name="thead">
              <xsl:element name="tr">
                <xsl:element name="th">Ref.</xsl:element>
                <xsl:element name="th">Nombre</xsl:element>
                <xsl:element name="th">Marca</xsl:element>
                <xsl:element name="th">Descripción</xsl:element>
                <xsl:element name="th">Procesador</xsl:element>
                <xsl:element name="th">RAM</xsl:element>
                <xsl:element name="th">Almacenamiento</xsl:element>
                <xsl:element name="th">Precio</xsl:element>
                <xsl:element name="th">Stock</xsl:element>
                <xsl:element name="th">Valoración</xsl:element>
              </xsl:element>
            </xsl:element>

            <xsl:element name="tbody">
              <!-- ORDENAMOS los productos por precio ascendente dentro de cada categoría -->
              <xsl:for-each select="producto">
                <xsl:sort select="precio" data-type="number" order="ascending"/>

                <xsl:element name="tr">

                  <!-- ID del producto -->
                  <xsl:element name="td">
                    <xsl:value-of select="@id"/>
                  </xsl:element>

                  <!-- Nombre -->
                  <xsl:element name="td">
                    <strong><xsl:value-of select="nombre"/></strong>
                  </xsl:element>

                  <!-- Marca -->
                  <xsl:element name="td">
                    <xsl:value-of select="marca"/>
                  </xsl:element>

                  <!-- Descripción -->
                  <xsl:element name="td">
                    <xsl:value-of select="descripcion"/>
                  </xsl:element>

                  <!-- Procesador -->
                  <xsl:element name="td">
                    <xsl:value-of select="especificaciones/procesador"/>
                  </xsl:element>

                  <!-- RAM -->
                  <xsl:element name="td">
                    <xsl:value-of select="especificaciones/ram"/>
                  </xsl:element>

                  <!-- Almacenamiento -->
                  <xsl:element name="td">
                    <xsl:value-of select="especificaciones/almacenamiento"/>
                  </xsl:element>

                  <!-- Precio con moneda -->
                  <xsl:element name="td">
                    <xsl:value-of select="precio"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="precio/@moneda"/>
                  </xsl:element>

                  <!-- Stock: si es menor a 10 avisa visualmente con xsl:if -->
                  <xsl:element name="td">
                    <xsl:value-of select="stock"/>
                    <xsl:if test="stock &lt; 10">
                      <xsl:element name="span">
                        <xsl:attribute name="class">badge-stock</xsl:attribute>
                        &#9888; Pocas unidades
                      </xsl:element>
                    </xsl:if>
                  </xsl:element>

                  <!-- Valoración: color según nivel con xsl:choose -->
                  <xsl:element name="td">
                    <xsl:choose>
                      <xsl:when test="valoracion &gt;= 4.7">
                        <xsl:element name="span">
                          <xsl:attribute name="class">val-alto</xsl:attribute>
                          &#11088; <xsl:value-of select="valoracion"/>
                        </xsl:element>
                      </xsl:when>
                      <xsl:when test="valoracion &gt;= 4.3">
                        <xsl:element name="span">
                          <xsl:attribute name="class">val-medio</xsl:attribute>
                          &#11088; <xsl:value-of select="valoracion"/>
                        </xsl:element>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:element name="span">
                          <xsl:attribute name="class">val-bajo</xsl:attribute>
                          &#11088; <xsl:value-of select="valoracion"/>
                        </xsl:element>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:element>

                </xsl:element><!-- fin tr -->
              </xsl:for-each><!-- fin for-each producto -->
            </xsl:element><!-- fin tbody -->
          </xsl:element><!-- fin table -->

        </xsl:for-each><!-- fin for-each categoria -->

        <!-- PIE DE PÁGINA -->
        <xsl:element name="footer">
          <xsl:text>© </xsl:text>
          <xsl:value-of select="catalogo/empresa/nombre"/>
          <xsl:text> — </xsl:text>
          <xsl:value-of select="catalogo/empresa/web"/>
        </xsl:element>

      </xsl:element><!-- fin body -->
    </xsl:element><!-- fin html -->
  </xsl:template>

</xsl:stylesheet>
