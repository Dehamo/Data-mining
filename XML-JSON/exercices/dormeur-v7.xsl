<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <body>
        <table border="2px">
          <tr>
          </tr>
          <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="lg">
    <xsl:for-each select="l">
      <tr>
        <td>
          <xsl:value-of select="."/>
          <xsl:text/>
        </td>
      </tr>
    </xsl:for-each>
    <xsl:if test="following-sibling::*[1]">
      <tr>
        <td>
          <br/>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>