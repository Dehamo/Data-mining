<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Musée des Augustins</title>
            </head>
            <body>
                <p align = "justify">
                <xsl:apply-templates select="document/oeuvre"/>
                </p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="oeuvre">
        <xsl:for-each select="oeuvre">
            <xsl:sort select="numeroInventaire" data-type="number" order="ascending"/>
        </xsl:for-each>
        <span style="color:teal;font-weight: bold;">
        <br/>
        <xsl:value-of select="numeroInventaire"/>
        <br/>
        </span>
        <span style="color:grey; font-weight:bold;">
        <xsl:value-of select="auteur1"/>
        </span>
        <br/>
    </xsl:template>
</xsl:stylesheet>

