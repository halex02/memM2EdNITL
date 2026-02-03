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
		\documentclass[12pt, a4paper]{book}<!-- Choix de la class book conditionné par l’usage du package reledmac -->
		
		\newcommand{\styleabbr}[1]{\textit{#1}}<!-- Création d’une fonction dédiée au stylage des résolutions d’abbréviation -->
		
		\usepackage[utf8]{inputenc}
		\usepackage[T1]{fontenc}
		
		\usepackage[series={A,B,C,D},noend,noeledsec,nofamiliar,noledgroup]{reledmac}<!-- package spécialisé pour l’édition critique -->
		
		\usepackage{polyglossia}
		\setmainlanguage{french}
		\setotherlanguage{latin}
		
		\begin{document}
			\title{Édition critique de}
			\maketitle
		
			\beginnumbering
			<xsl:apply-templates/>
			\endnumbering
		\end{document}
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
	\pstart
	<xsl:apply-templates/>
	\pend
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
		<xsl:text disable-output-escaping="yes">\styleabbr{</xsl:text>
		<xsl:value-of select="expan"/>
		<xsl:text disable-output-escaping="yes">}</xsl:text>
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
