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
            <xsl:sort select="auteur1" data-type="text" order="ascending"/>
        </xsl:for-each>
        <span style="color:teal;font-weight: bold;">
        <br/>
        <xsl:value-of select="auteur1"/>
        <br/>
        </span>
        <span style="color:grey; font-weight:bold;">
        <xsl:value-of select="designation"/>
        </span>
        <br/>
        <xsl:text>Date : </xsl:text>
        <xsl:value-of select="datation1"/>
        <br/>
        <xsl:text>Dimensions : </xsl:text>
        <xsl:value-of select="mesure1"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="mesure2"/>
        <br/>
        <xsl:text>Précisions sur l'auteur : </xsl:text>
        <xsl:value-of select="precisionAuteur1"/>
        <br/>
        <xsl:text>Deuxième auteur : </xsl:text>
        <xsl:value-of select="auteur2"/>
        <br/>
        <xsl:text>Précisions sur le deuxième auteur : </xsl:text>
        <xsl:value-of select="precisionAuteur2"/>
        <br/>
        <xsl:text>Autre désignation : </xsl:text>
        <xsl:value-of select="designation2"/>
        <br/>
        <xsl:text>Autre datation : </xsl:text>
        <xsl:value-of select="datation2"/>
        <br/>
        <xsl:text>Domaine : </xsl:text>
        <xsl:value-of select="domaine"/>
        <br/>
        <xsl:text>Technique : </xsl:text>
        <xsl:value-of select="technique"/>
        <br/>
        <xsl:text>Matière : </xsl:text>
        <xsl:value-of select="matière"/>
        <br/>
        <xsl:text>Inscription : </xsl:text>
        <xsl:value-of select="inscriptionType1"/>
        <br/>
        <xsl:text>Emplacement de l'inscription : </xsl:text>
        <xsl:value-of select="inscriptionEmplace"/>
        <br/>
        <xsl:text>Mode d'acquisition : </xsl:text>
        <xsl:value-of select="modeAcquisition"/>
        <br/>
        <xsl:text>Date d'acquisition : </xsl:text>
        <xsl:value-of select="dateAcquis"/>
        <br/>
        <xsl:text>Donateur/vendeur : </xsl:text>
        <xsl:value-of select="donateurVendeur"/>
        <br/>
        <xsl:text>Note d'acquisition : </xsl:text>
        <xsl:value-of select="notesAcquisition"/>
        <br/>
        <xsl:text>Numéro d'acquisition : </xsl:text>
        <xsl:value-of select="numeroAcquisition"/>
        <br/>
        <xsl:text>Numéro d'inventaire : </xsl:text>
        <xsl:value-of select="numeroInventaire"/>
        <br/>
        <xsl:text>Image : </xsl:text>
        <xsl:value-of select="image"/>
        <br/>
        <xsl:text>URL de l'image : </xsl:text>
        <xsl:value-of select="commons/image/page"/>
        <br/>
        <xsl:text>Taille originale : </xsl:text>
        <xsl:value-of select="commons/image/url"/>
        <br/>
        <xsl:text>Image redimensionnée : </xsl:text>
        <xsl:value-of select="commons/image/thumbnail"/>
        <br/>
    </xsl:template>
</xsl:stylesheet>

