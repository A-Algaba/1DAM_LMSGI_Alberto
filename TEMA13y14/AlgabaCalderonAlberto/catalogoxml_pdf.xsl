<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <!-- ============================================================
       TEMPLATE RAÍZ: estructura FO completa
  ============================================================ -->
  <xsl:template match="/">
    <fo:root>

      <!-- 1. DEFINICIÓN DE PÁGINA -->
      <fo:layout-master-set>
        <fo:simple-page-master master-name="pagina-A4"
          page-height="297mm" page-width="210mm"
          margin-top="20mm" margin-bottom="20mm"
          margin-left="18mm" margin-right="18mm">

          <fo:region-body   margin-top="15mm" margin-bottom="12mm"/>
          <fo:region-before extent="12mm"/>
          <fo:region-after  extent="10mm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <!-- 2. SECUENCIA DE PÁGINAS -->
      <fo:page-sequence master-reference="pagina-A4">

        <!-- CABECERA de página -->
        <fo:static-content flow-name="xsl-region-before">
          <fo:block font-size="8pt" color="#888888" border-bottom="0.5pt solid #cccccc"
                    padding-bottom="3pt" text-align="right">
            <xsl:value-of select="catalogo/empresa/nombre"/>
            <xsl:text>  |  </xsl:text>
            <xsl:value-of select="catalogo/empresa/web"/>
          </fo:block>
        </fo:static-content>

        <!-- PIE de página con número -->
        <fo:static-content flow-name="xsl-region-after">
          <fo:block font-size="8pt" color="#888888" text-align="center"
                    border-top="0.5pt solid #cccccc" padding-top="3pt">
            Página <fo:page-number/> — <xsl:value-of select="catalogo/titulo"/>
          </fo:block>
        </fo:static-content>

        <!-- CUERPO principal -->
        <fo:flow flow-name="xsl-region-body">

          <!-- TÍTULO PRINCIPAL -->
          <fo:block font-size="20pt" font-weight="bold" color="#1a1a2e"
                    space-after="4pt" border-bottom="2pt solid #e94560"
                    padding-bottom="6pt">
            <xsl:value-of select="catalogo/titulo"/>
          </fo:block>

          <!-- DATOS DE EMPRESA -->
          <fo:block font-size="9pt" color="#555555" space-after="14pt">
            <xsl:value-of select="catalogo/empresa/nombre"/>
            <xsl:text>  ·  </xsl:text>
            <xsl:value-of select="catalogo/empresa/web"/>
            <xsl:text>  ·  </xsl:text>
            <xsl:value-of select="catalogo/empresa/telefono"/>
            <xsl:text>  ·  Fecha: </xsl:text>
            <xsl:value-of select="catalogo/fecha"/>
          </fo:block>

          <!-- RECORREMOS CADA CATEGORÍA -->
          <xsl:for-each select="catalogo/categoria">

            <!-- Título de categoría -->
            <fo:block font-size="13pt" font-weight="bold" color="#16213e"
                      background-color="#e8eaf6" padding="5pt 8pt"
                      space-before="14pt" space-after="6pt">
              <xsl:value-of select="@nombre"/>
            </fo:block>

            <!-- TABLA de productos -->
            <fo:table table-layout="fixed" width="100%"
                      border="0.5pt solid #cccccc" space-after="10pt">

              <!-- Anchos de columnas -->
              <fo:table-column column-width="12mm"/>  <!-- Ref -->
              <fo:table-column column-width="38mm"/>  <!-- Nombre -->
              <fo:table-column column-width="20mm"/>  <!-- Marca -->
              <fo:table-column column-width="22mm"/>  <!-- Procesador -->
              <fo:table-column column-width="18mm"/>  <!-- RAM -->
              <fo:table-column column-width="18mm"/>  <!-- Precio -->
              <fo:table-column column-width="12mm"/>  <!-- Stock -->
              <fo:table-column column-width="14mm"/>  <!-- Val. -->

              <!-- Cabecera de tabla -->
              <fo:table-header>
                <fo:table-row background-color="#16213e" color="#ffffff">
                  <fo:table-cell padding="4pt" border="0.5pt solid #444">
                    <fo:block font-size="8pt" font-weight="bold">Ref.</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="4pt" border="0.5pt solid #444">
                    <fo:block font-size="8pt" font-weight="bold">Nombre</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="4pt" border="0.5pt solid #444">
                    <fo:block font-size="8pt" font-weight="bold">Marca</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="4pt" border="0.5pt solid #444">
                    <fo:block font-size="8pt" font-weight="bold">Procesador</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="4pt" border="0.5pt solid #444">
                    <fo:block font-size="8pt" font-weight="bold">RAM</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="4pt" border="0.5pt solid #444">
                    <fo:block font-size="8pt" font-weight="bold">Precio</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="4pt" border="0.5pt solid #444">
                    <fo:block font-size="8pt" font-weight="bold">Stock</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="4pt" border="0.5pt solid #444">
                    <fo:block font-size="8pt" font-weight="bold">Val.</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>

              <!-- Filas de productos ordenadas por precio -->
              <fo:table-body>
                <xsl:for-each select="producto">
                  <xsl:sort select="precio" data-type="number" order="ascending"/>

                  <!-- Color de fila alternante con xsl:choose -->
                  <fo:table-row>
                    <xsl:attribute name="background-color">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 0">#f0f4ff</xsl:when>
                        <xsl:otherwise>#ffffff</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>

                    <!-- Ref -->
                    <fo:table-cell padding="4pt" border="0.5pt solid #ddd">
                      <fo:block font-size="7.5pt" color="#666">
                        <xsl:value-of select="@id"/>
                      </fo:block>
                    </fo:table-cell>

                    <!-- Nombre -->
                    <fo:table-cell padding="4pt" border="0.5pt solid #ddd">
                      <fo:block font-size="8pt" font-weight="bold">
                        <xsl:value-of select="nombre"/>
                      </fo:block>
                    </fo:table-cell>

                    <!-- Marca -->
                    <fo:table-cell padding="4pt" border="0.5pt solid #ddd">
                      <fo:block font-size="8pt">
                        <xsl:value-of select="marca"/>
                      </fo:block>
                    </fo:table-cell>

                    <!-- Procesador -->
                    <fo:table-cell padding="4pt" border="0.5pt solid #ddd">
                      <fo:block font-size="7.5pt">
                        <xsl:value-of select="especificaciones/procesador"/>
                      </fo:block>
                    </fo:table-cell>

                    <!-- RAM -->
                    <fo:table-cell padding="4pt" border="0.5pt solid #ddd">
                      <fo:block font-size="7.5pt">
                        <xsl:value-of select="especificaciones/ram"/>
                      </fo:block>
                    </fo:table-cell>

                    <!-- Precio -->
                    <fo:table-cell padding="4pt" border="0.5pt solid #ddd">
                      <fo:block font-size="8pt" font-weight="bold" color="#1a1a2e">
                        <xsl:value-of select="precio"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="precio/@moneda"/>
                      </fo:block>
                    </fo:table-cell>

                    <!-- Stock: aviso si es bajo con xsl:if -->
                    <fo:table-cell padding="4pt" border="0.5pt solid #ddd">
                      <fo:block font-size="8pt">
                        <xsl:value-of select="stock"/>
                        <xsl:if test="stock &lt; 10">
                          <fo:inline color="#c0392b" font-weight="bold"> (!)</fo:inline>
                        </xsl:if>
                      </fo:block>
                    </fo:table-cell>

                    <!-- Valoración con color según nivel -->
                    <fo:table-cell padding="4pt" border="0.5pt solid #ddd">
                      <fo:block font-size="8pt" font-weight="bold">
                        <xsl:choose>
                          <xsl:when test="valoracion &gt;= 4.7">
                            <fo:inline color="#27ae60">
                              <xsl:value-of select="valoracion"/>
                            </fo:inline>
                          </xsl:when>
                          <xsl:when test="valoracion &gt;= 4.3">
                            <fo:inline color="#e67e22">
                              <xsl:value-of select="valoracion"/>
                            </fo:inline>
                          </xsl:when>
                          <xsl:otherwise>
                            <fo:inline color="#c0392b">
                              <xsl:value-of select="valoracion"/>
                            </fo:inline>
                          </xsl:otherwise>
                        </xsl:choose>
                      </fo:block>
                    </fo:table-cell>

                  </fo:table-row>
                </xsl:for-each>
              </fo:table-body>

            </fo:table>

          </xsl:for-each><!-- fin for-each categoria -->

        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

</xsl:stylesheet>
