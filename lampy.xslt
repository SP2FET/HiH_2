<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

  <xsl:template match="/">
    <html>
      <head>
        <title> TEST</title>
      
      </head>
      <body>
        <xsl:apply-templates select="spis_tresci"/>
        <xsl:value-of select="artykul"/>
        <table border="1">
          <tr bgcolor="#0000ff" style="color:#ffffff">
            <th>Lp.</th>
            <th>Tytuł polski</th>
            <th>Tytuł oryginalny</th>
            <th>Reżyseria</th>
            <th>Produkcja</th>
            <th>Rok produkcji</th>
            <th>Czas trwania</th>
            <th>Gatunek</th>
            <th>Obsada</th>
            <th>Linki</th>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="spis_tresci" >
    <ul>
      <li>test</li>
  <xsl:for-each select="wpis">
    <li>
      <xsl:value-of select="."/>
    </li>
  </xsl:for-each>
      </ul>
  </xsl:template>
    
</xsl:stylesheet>
