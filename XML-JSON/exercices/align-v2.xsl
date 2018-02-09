<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8"/>
<xsl:template match="/phrases">
<link rel="stylesheet" type="text/css" href="style-v1.css" />
	<html>
		<head>
			<title>Alignement</title>
		</head>
		<body>
			<table border="1px">
				<tr>
					<th><xsl:text/>Anglais</th>
					<th><xsl:text/>Français</th>
				</tr>
				<xsl:for-each select="pair">
					<tr>
						<td> <xsl:value-of select="en" /> </td>
						<td> <xsl:value-of select="fr" /> </td>
					</tr>
				</xsl:for-each>
			</table>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>