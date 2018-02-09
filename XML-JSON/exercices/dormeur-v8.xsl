<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:template match="/">
    <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/>
  </xsl:template>
  <xsl:template match="lg">
    <xsl:value-of select="l[contains(text(), ';')]"/><xsl:text>
</xsl:text>
    <xsl:text></xsl:text>
    <xsl:value-of select="l[contains(text(), ':')]"/><xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
