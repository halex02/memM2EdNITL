<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="xs"
                version="2.0">
	<xsl:output method="text"
	            encoding="UTF-8"
	            indent="no"/>
	<!-- <xsl:strip-space elements="*"/> -->
	<xsl:template match="/">
		
			<xsl:apply-templates/>
			
	</xsl:template>
	
	<xsl:template match="teiHeader" />
	
	<xsl:template match="body">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="text">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="div[@type='corps-de-texte']">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="head">
		<xsl:text disable-output-escaping="yes">\chapter{</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">}</xsl:text>
	</xsl:template>
	
	<xsl:template match="p">
	<xsl:apply-templates/>
	<xsl:text>
</xsl:text>
	</xsl:template>
	<!-- 
	%%%%%%%%%%%%%%%%%%%%%%%%%
	Gestion des abbréviations: 
	affichage uniquement de la 
	résolution et stylage en 
	italique
	%%%%%%%%%%%%%%%%%%%%%%%%% 
	-->
	<xsl:template match="choice[descendant::abbr]">
		<xsl:value-of select="abbr"/>
	</xsl:template>
	<xsl:template match="abbr"/>
	<xsl:template match="expan"/>
	
	<!-- 
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	Gestion des corrections éditoriales: 
	affichage de la correction entre 
	crochets droits.
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
	-->
	<xsl:template match="choice[descendant::sic]">
		<xsl:text disable-output-escaping="yes">[</xsl:text>
		<xsl:value-of select="corr"/>
		<xsl:text disable-output-escaping="yes">]</xsl:text>
	</xsl:template>
	<xsl:template match="sic"/>
	<xsl:template match="corr"/>
	
	<xsl:template match="text()">
	<xsl:value-of select="." disable-output-escaping="yes"/>
	</xsl:template>
	
	
	<xsl:template match="placeName">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- 
	%%%%%%%%%%%%%%%%%%%%%%%%
	Traitement des lb et pb:
	%%%%%%%%%%%%%%%%%%%%%%%% 
	-->
	<xsl:template match="lb"/><!-- les lb sont tout simplement ignorés pour la conversion en latex -->
	<xsl:template match="pb"><!-- modifier ce template pour qu’il ajoute des tirets dans le cas ou la coupure se fait au milieu d’un mot -->
	<xsl:text>[</xsl:text>
	<xsl:value-of select="@xml:id"/>
	<xsl:text>]</xsl:text>
	</xsl:template>
	
	<xsl:template match="del"/>
	<xsl:template match="gap">
	<xsl:text>GAP</xsl:text>
	</xsl:template>
</xsl:stylesheet>
