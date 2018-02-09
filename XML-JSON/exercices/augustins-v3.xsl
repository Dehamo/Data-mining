<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <script type="text/javascript">
function flipflop(id) { if (document.getElementById(id).style.display == "none") document.getElementById(id).style.display = "block"; else	document.getElementById(id).style.display = "none"; } function flipflopON(id1,id2) { if (document.getElementById(id1).style.display == "none") { document.getElementById(id1).style.display = "block"; document.getElementById(id2).style.display = "none"; } else	{document.getElementById(id1).style.display = "none"; document.getElementById(id2).style.display = "block"; } } function flipflopOFF(id1,id2) { if (document.getElementById(id1).style.display == "none") { document.getElementById(id1).style.display = "block"; document.getElementById(id2).style.display = "none"; } else	{document.getElementById(id1).style.display = "none"; document.getElementById(id2).style.display = "block"; } }
                </script>
                <title>Musée des Augustins</title> 
            </head>
            <body>
                <p align = "justify">             
                    <xsl:for-each select="document/oeuvre">
                        <xsl:sort select="numeroInventaire" data-type="number" order="ascending"/>
                        <span style="color:teal;font-weight: bold;">
                        <br/>
                        <xsl:value-of select="numeroInventaire"/>
                        <br/>
                        </span>
                        <span style="color:grey; font-weight:bold;">
                        <xsl:value-of select="auteur1"/>
                        </span>
                        <br/>
                        <p align="justify" id="on{generate-id()}" onclick="flipflopON('off{generate-id()}','on{generate-id()}');">
                        <span style="font-style: italic">Voir plus...</span>
                        </p>
                        <section id="off{generate-id()}" style="display:none">
                            <p align="justify" onclick="flipflopOFF('on{generate-id()}','off{generate-id()}');">
                            <span style="font-style: italic">Masquer...</span>
                            </p>
                            <blockquote>
                                <xsl:text>Nom de l'oeuvre : </xsl:text>
                                <xsl:value-of select="designation"/>
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
                            </blockquote>
                        </section>
                    </xsl:for-each>
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

