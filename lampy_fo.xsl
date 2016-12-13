<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8" />

  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
        <fo:simple-page-master master-name="strona" margin="1cm">
          <fo:region-body  margin="2cm" margin-left="1cm" margin-right="1cm"/>
          <fo:region-before extent="3cm"/>
          <fo:region-after extent="5mm"/>
        </fo:simple-page-master>
        
        <fo:simple-page-master master-name="okladka" margin-top="2cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm"> 
          <fo:region-body margin-top="2cm"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="koncowa" margin-top="7cm" margin-bottom="2cm" margin-left="3cm" margin-right="3cm">
          <fo:region-body  margin="2cm" margin-left="1cm" margin-right="1cm"/>
          <fo:region-before extent="3cm"/>
          <fo:region-after extent="5mm"/>
        </fo:simple-page-master>

        <fo:page-sequence-master master-name="nazwa">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference master-reference="okladka" page-position="first"/>
            <fo:conditional-page-master-reference master-reference="strona" page-position="rest"/>
             <fo:conditional-page-master-reference master-reference="koncowa" page-position="last"/>
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
        
      </fo:layout-master-set>

      <fo:page-sequence master-reference="okladka">


        <fo:flow flow-name="xsl-region-body">
          <fo:block text-align="center" color="orange" font-size="20pt">
            <fo:inline font-style="italic">Lampy elektronowe</fo:inline>
          </fo:block>

          <fo:block space-before="1cm" text-align="center">
            <fo:external-graphic src="lampa.png" width="4cm" />
          </fo:block>
        </fo:flow>

      </fo:page-sequence>

      <fo:page-sequence master-reference="strona">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block color="blue" font-size="16pt" font-family="Arial" text-align="center">Lampy elektronowe</fo:block>
        </fo:static-content>

        <fo:static-content flow-name="xsl-region-after">
          <fo:block font-size="10pt" font-family="Calibri" text-align="center">
            Strona <fo:page-number/>
          </fo:block>
        </fo:static-content>
        
        <fo:flow flow-name="xsl-region-body">
          <fo:block  page-break-before="always" text-align="justify" font-size="13pt">
            <xsl:apply-templates select="//artykul"/>
          </fo:block>

          <xsl:call-template name="wzmacniacze"/>
          <fo:block  font-family="Calibri" space-before="1cm">
            Typowe układy lampowe:
            <xsl:call-template name="uklady"/>
          </fo:block>
        </fo:flow>
      
    </fo:page-sequence>

      <fo:page-sequence master-reference="koncowa">
        
        <fo:static-content flow-name="xsl-region-after">
          <fo:block font-size="10pt" font-family="Calibri" text-align="center">
            Strona <fo:page-number/>
          </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body">
          <fo:block text-align="center" font-size="20pt" font-family="Calibri">
            PDF na potrzeby projektu
          </fo:block>
        </fo:flow>

      </fo:page-sequence>
      
      
    </fo:root>
  </xsl:template>


  <xsl:template name="wzmacniacze">
    <fo:block font-family="Calibri" text-align="center" space-before="5mm" space-after="5mm">Przykładowe wzmacniacze:</fo:block>
    <fo:table table-layout="fixed" text-align="center" width="100%" border="solid black 1px" font-family="Calibri">
      <fo:table-column column-width="8mm"/>
      <fo:table-column column-width="43mm"/>
      <fo:table-column column-width="15mm"/>
      <fo:table-column column-width="40mm"/>
      <fo:table-column column-width="20mm"/>
      <fo:table-column column-width="23mm"/>
      <fo:table-header>
        <fo:table-row>
          <fo:table-cell border="solid black 2px">
            <fo:block font-weight="bold" background-color="#cccccc">Lp.</fo:block>
          </fo:table-cell>
          <fo:table-cell border="solid black 2px">
            <fo:block font-weight="bold" background-color="#cccccc">Nazwa</fo:block>
          </fo:table-cell>
          <fo:table-cell border="solid black 2px">
            <fo:block font-weight="bold" background-color="#cccccc">Moc</fo:block>
          </fo:table-cell>
          <fo:table-cell border="solid black 2px">
            <fo:block font-weight="bold" background-color="#cccccc">Lampy</fo:block>
          </fo:table-cell>
          <fo:table-cell border="solid black 2px">
            <fo:block font-weight="bold" background-color="#cccccc">Typ</fo:block>
          </fo:table-cell>
          <fo:table-cell border="solid black 2px">
            <fo:block font-weight="bold" background-color="#cccccc">Cena</fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-header>
      <fo:table-body>
        <xsl:apply-templates select="/strona/wzmacniacz"/>
      </fo:table-body>
    </fo:table>
  </xsl:template>

  <xsl:template match="wzmacniacz">  
    <fo:table-row>
      <fo:table-cell border="solid black 2px">
        <fo:block>
          <xsl:number format="1"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 2px">
        <fo:block>
          <xsl:value-of select="@nazwa"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 2px">
        <fo:block>
          <xsl:value-of select='format-number(moc,"### W")'/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 2px">
        <fo:block>
          <xsl:value-of select="lampy"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 2px">
        <fo:block>
          <xsl:value-of select="typ"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 2px">
        <fo:block>
          <xsl:value-of select='format-number(cena,"#,###.## zł")'/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>  
  </xsl:template>

  <xsl:template name="dataCzas">
    <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('dd MMMM yyyy, HH:mm:ss'), java:java.util.Date.new())"/>
  </xsl:template>

  <xsl:template match="artykul">
    <fo:block page-break-before="always" font-family="Calibri" space-before="5mm" space-after="5mm" >
      Tytuł artykułu: <xsl:value-of select="@nazwa"/>
      <fo:block space-before="3mm">
      <xsl:value-of select="." />
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template name="uklady">
    <fo:list-block>
      <xsl:apply-templates select="strona/uklady"/>
    </fo:list-block>
  </xsl:template>
  
  <xsl:template match="uklad">   
      <fo:list-item>
        <fo:list-item-label>
          <fo:block>*</fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="1cm">
          <fo:block>
            <xsl:value-of select="typ"/>
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
  </xsl:template>
  
  
</xsl:stylesheet>