<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  
<xsl:template match="/">
  <html>
    <head>
      <link rel="stylesheet" type="text/css" href="style2.css"/>
      <title>Moja strona</title>
    </head>
    <body>
    
      <h2 style="text-align: center;">Strona o lampach elektronowych</h2>
      
      <xsl:apply-templates select="strona/spis_tresci"/>
      <xsl:apply-templates select="strona/artykuly"/>

      
    </body>
  </html>
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


<xsl:template match="linki">

    <div style="display:block; float:left; margin-right:20px;">
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
    Ocena artykułu:  <xsl:value-of select="@ocena"/>
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


  
</xsl:stylesheet>
