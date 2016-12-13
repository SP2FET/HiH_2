<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="rok"> 
      2016
  </xsl:variable>
  
<xsl:template match="/">
  <html>
    <head>
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <title>Moja strona</title>
    </head>
    <body>
    
      <h2 style="text-align: center;">Strona o lampach elektronowych</h2>
      
      <xsl:apply-templates select="strona/spis_tresci"/>
      <xsl:apply-templates select="strona/artykuly"/>
      <xsl:call-template name="wzmacniacze"/>
      <xsl:apply-templates select="strona/lampy"/>
      <xsl:apply-templates select="strona/uklady"/>
      <xsl:apply-templates select="strona/stopka"/>
      
    </body>
  </html>
</xsl:template>
  
<xsl:template match="stopka[@kompletna='nie']">
    <div class="center">
      <xsl:if test="$rok = 2016">
        <xsl:value-of select="."/>
        <xsl:value-of select='$rok'/>
      </xsl:if>    
    </div>
  </xsl:template>

<xsl:template name="wzmacniacze">
    <div class="srodek" id="wzm">
    <table>
      <tr>
        <th>L.p.</th>
        <th>Nazwa wzmacniacza</th>
        <th>Typ</th>
        <th>Moc</th>
        <th>Lampy</th>
        <th>Cena</th>
      </tr>
      <xsl:for-each select="strona/wzmacniacz">
        <xsl:sort select="moc" order="ascending"/>
        <tr>
          <td>
            <xsl:number value="position()" format="I." />
          </td>
          <td>
            <xsl:value-of select="@nazwa"/>
          </td>
          <td>
            <xsl:value-of select="typ"/>
          </td>
          <td>    
            <xsl:value-of select='format-number(moc,"### W")'/>
          </td>
          <td>
            <xsl:value-of select="lampy"/>
          </td>
          <td>
            <xsl:value-of select='format-number(cena,"#,###.## zł")'/>
           
          </td>
        </tr>
      </xsl:for-each>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td>Ilość:</td>
        <td>
          <xsl:value-of select='count(strona/wzmacniacz)'/>
        </td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td>Cena wszystkich:</td>
        <td>
          <xsl:value-of select='sum(//cena)'/> zł
        </td>
      </tr>
      <tr>
        <td></td>
        <td>Zaokrąglona:</td>
        <td>
          <xsl:value-of select='round(sum(//cena))'/> zł
        </td>
      </tr>
    </table>
    </div>
  </xsl:template>

<xsl:template match="spis_tresci">
  <div id="spis">
  <ul>
   <xsl:for-each select="wpis">
     <li>
       <a>
         <xsl:attribute name="href">
           <xsl:value-of select="@do"/>
         </xsl:attribute>
         <xsl:value-of select="."/>
       </a>
      
     </li>  
  </xsl:for-each>
</ul>
  </div>
</xsl:template>

<xsl:template match="lampy">
  <div id="lampy" class="srodek">
    
  <table>
    <tr>
      <th>L.p</th>
      <th>Nazwa</th>
      <th>Typ</th>
      <th>Ua</th>
      <th>Zdjęcie</th>
    </tr>
 
  <xsl:for-each select="lampa">
    <xsl:sort select="@nazwa"/>
    <tr>
      <td>
        <xsl:number value="position()"/>
      </td>
      <td>
        <xsl:value-of select="@nazwa"/>
      </td>
      <td>
        <xsl:value-of select="typ"/>
      </td>
      <td>
        <xsl:value-of select="Ua"/>
   
      </td>
      <td>
        <xsl:if test="zdjecie/@zrodlo != ' '">
          <div>
        <xsl:apply-templates select="zdjecie"/>
          </div>
       </xsl:if> 
      </td>
    </tr>

  </xsl:for-each>
  </table>
  </div>
  
</xsl:template>

<xsl:template match="linki">

    <div style="display:block; float:right; margin-right:20px;">
      Linki zwenętrzne:
      <p>
      <xsl:apply-templates/>
      </p>
    </div>
  </xsl:template>

<xsl:template match="artykuly">

  <xsl:apply-templates select="linki"/>
  <xsl:for-each select="artykul">
  <div class="srodek">
    <p>
      <xsl:value-of select="."/>
    </p>
    Ocena artykułu:
    <xsl:choose>
      <xsl:when test="@ocena &gt; 4">
        <span class="ocena_ok">
          <xsl:value-of select="@ocena"/>
        </span>
      </xsl:when>

      <xsl:when test="@ocena &lt; 3">
        <span class="ocena_zla">
          <xsl:value-of select="@ocena"/>
        </span>
      </xsl:when>

      <xsl:otherwise>
        <span>
          <xsl:value-of select="@ocena"/>
        </span>
      </xsl:otherwise>

    </xsl:choose>
  </div>
    </xsl:for-each>
 
</xsl:template>

<xsl:template match="link">
   
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="@link_href"/>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </a>
  <br/>
    
  </xsl:template>

<xsl:template match="zdjecie">
    <div>
      <img>
        <xsl:attribute name="src">
          <xsl:value-of select="@zrodlo"/>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="@opis"/>
        </xsl:attribute>
      </img>
    </div>
  </xsl:template>

<xsl:template match="uklady">
    <div id="uklady" class="srodek">
      <xsl:for-each select="uklad">
        <div>
          <h3>
            Układ <xsl:value-of select="typ"/>:
          </h3>
          <p>
            <xsl:value-of select="opis"/>
          </p>
          
        </div>
      </xsl:for-each> 
      
    </div>
  </xsl:template>
  
</xsl:stylesheet>
