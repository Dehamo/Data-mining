<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8"/>
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
            <xsl:choose>
                <xsl:when test="contains(@pos, 'DET')">
                    <xsl:if test="contains(@pos, 'fem')">
                        <span style="color: red;">
                        <xsl:value-of select="concat(@wordform, ' ')"/>
                        </span>
                    </xsl:if>
                    <xsl:if test="contains(@pos, 'masc')">
                        <span style="color: blue;">
                        <xsl:value-of select="concat(@wordform, ' ')"/>
                        </span>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(@wordform, ' ')"/>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:for-each>
    </p>
</xsl:for-each>
</body>
</html>
</xsl:template>
</xsl:stylesheet>