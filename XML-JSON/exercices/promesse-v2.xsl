<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="5.0" encoding="UTF-8"/>
<xsl:template match="/trAnnot">
<link rel="stylesheet" type="text/css" href="style-v2.css"/>
<html>
<head>
<title>La promesse - en
</title>
</head>
<body>
<table border="1px">
<xsl:for-each select="linkList">
<xsl:if test="@level='chunk'">
<xsl:for-each select="linkGroup">
<xsl:for-each select="link">
<tr>
<td>
<xsl:value-of select="docSpan[1]"/>
</td>
</tr>
</xsl:for-each>
</xsl:for-each>
</xsl:if>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>