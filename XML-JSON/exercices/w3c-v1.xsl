
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="utf-8"/>
<xsl:template match="/">
<html>
<head>
<title>W3C</title>
</head>
<body>
<h1>Recommandation XSLT 1.0</h1>
<xsl:for-each select="doc/taggersent">
<p align="justify">
<xsl:for-each select="taggertoken">
<xsl:value-of select="concat(@wordform, ' ')"/>
</xsl:for-each>
</p>
</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>