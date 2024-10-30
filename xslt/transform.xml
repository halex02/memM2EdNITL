<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Définition du template racine, appliqué à la racine du document XML -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Transformation XSLT</title>
            </head>
            <body>
                <h1>Résultat de la transformation</h1>
                
                <!-- Exemple : boucle sur chaque élément 'item' -->
                <xsl:for-each select="//item">
                    <div>
                        <!-- Accès aux valeurs de l’élément 'title' et 'description' -->
                        <h2><xsl:value-of select="title"/></h2>
                        <p><xsl:value-of select="description"/></p>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
