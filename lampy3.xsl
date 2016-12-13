<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>
  

  
<xsl:template match="/">
  <lampowa_strona>
    
    <xsl:apply-templates/>
    
  </lampowa_strona>
</xsl:template>

  <xsl:template match="spis_tresci">
    <xsl:element name="spis">
      <xsl:copy-of select="wpis"/>   
    </xsl:element>
  </xsl:template>

  <xsl:template match="artykuly">
    <xsl:for-each select="artykul">
      <xsl:element name="tekst">
      <xsl:element name="nazwa">
        
        <xsl:value-of select="@nazwa"/>
      </xsl:element>
        <xsl:element name="tresc">
          <xsl:element name="ocena">
            <xsl:value-of select="@ocena"/>
          </xsl:element>
          <xsl:value-of select="."/>
        </xsl:element>
      </xsl:element>
    </xsl:for-each>  
  </xsl:template>

  <xsl:template match="uklady">
    <xsl:for-each select="uklad">
      <xsl:element name="{typ}">
        <xsl:attribute name="ilosc_lamp">
          <xsl:value-of select="ilosc_lamp"/>
        </xsl:attribute>
        <xsl:value-of select="opis"/>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="lampy">
    <xsl:for-each select="lampa">
      <xsl:copy>
        <xsl:attribute name="{typ}">
          <xsl:text>tak</xsl:text>
        </xsl:attribute>
        <xsl:element name="nazwa">
          <xsl:value-of select="@nazwa"/>
        </xsl:element>
        <xsl:copy-of select="Ua"/>
      </xsl:copy>
    </xsl:for-each>
    
  </xsl:template>
  <xsl:template match="stopka|wzmacniacz">
    <xsl:copy-of select="."/>
  </xsl:template>

</xsl:stylesheet>
