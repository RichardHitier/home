<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="1.0">

<xsl:template match="/">
    <xsl:apply-templates select="DATASET/PARAM_METADATA"/>
</xsl:template>
   
<xsl:template match="PARAM_METADATA">
    <xsl:element name="parameter">
        <xsl:attribute name="name">
            <xsl:value-of select="PARAM_ID"/>
        </xsl:attribute>
        <xsl:attribute name="xml:id">
            <xsl:text>MAPSKP:</xsl:text>
            <xsl:value-of select="//DATASET/DATASET_METADATA/DATASET_ID"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="PARAM_ID"/>
        </xsl:attribute>
    </xsl:element>
</xsl:template>
   
</xsl:stylesheet>
