<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="lg">
    <xsl:for-each select=".">
      <xsl:choose>
        <xsl:when test="count(*)=4">
          <xsl:for-each select="l">
            <span style="font-weight: bold;">
              <xsl:value-of select="."/>
            </span>
            <br/>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="count(*)=3">
          <xsl:for-each select="l">
            <span style="font-style: italic;">
              <xsl:value-of select="."/>
            </span>
            <br/>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
      <br/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
