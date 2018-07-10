<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mods="http://www.loc.gov/mods/v3" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:template match="/">
        <xsl:apply-templates select="//h3" />
    </xsl:template>
    <xsl:template match="h3">
        <mods:mods>
            <mods:titleInfo>
                <mods:title>
                    <xsl:value-of select="text()" />
                </mods:title>
            </mods:titleInfo>
            <xsl:apply-templates select="../../h2" />
        </mods:mods>
    </xsl:template>
    <xsl:template match="h2">
            <mods:relatedItem type="Host">
                <mods:titleInfo>
                    <mods:title>
                        <xsl:value-of select="text()" />
                    </mods:title>
                </mods:titleInfo>
                <xsl:apply-templates select="../../h1" />
            </mods:relatedItem>
    </xsl:template>
    <xsl:template match="h1">
                <mods:relatedItem type="Host">
                    <mods:titleInfo>
                        <mods:title>
                            <xsl:value-of select="text()" />
                        </mods:title>
                    </mods:titleInfo>
                    <xsl:apply-templates select="../../h2" />
                </mods:relatedItem>
    </xsl:template>
    <xsl:template match="*" />
</xsl:stylesheet>