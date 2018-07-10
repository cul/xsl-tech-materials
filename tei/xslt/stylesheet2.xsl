<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.tei-c.org/ns/1.0" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template match="//div[@class='editorial']">
        <ns:editorialDecl>
            <xsl:apply-templates />
        </ns:editorialDecl>
    </xsl:template>
    <xsl:template match="div">
        <ns:p>
            <xsl:apply-templates />
        </ns:p>
    </xsl:template>
    <xsl:template match="a">
        <xsl:element name="ns:ref">
            <xsl:attribute name="target"><xsl:value-of select="@href" /></xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>