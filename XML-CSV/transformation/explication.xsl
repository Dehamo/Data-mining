<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:template match="/"> 
  <html> 
    <head> 
      <title>Exemple de sortie HTML</title> 
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    </head> 
    <body> 
      <h2>Données</h2>
      <p><xsl:value-of select="explication/donnees" /></p>
      <h2>Méthodologie</h2>
      <h3>Structuration</h3>
      <p><xsl:value-of select="explication/methodologie/structuration"/></p> 
      <h3>Modélisation</h3>
      <p><xsl:value-of select="explication/methodologie/modelisation"/></p> 
      <h3>Grammaire</h3>
      <p><xsl:value-of select="explication/methodologie/grammaire"/></p> 
      <h3>Web</h3>
      <p><xsl:value-of select="explication/methodologie/web"/></p> 
      <h2>Résultats</h2>
      <p><xsl:value-of select="explication/resultats"/></p> 
    </body> 
  </html> 
</xsl:template> 
</xsl:stylesheet> 