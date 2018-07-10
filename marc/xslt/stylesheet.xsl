<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mods="http://www.loc.gov/MARC21/slim" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="*[@ind1 = ' ' and @ind2 = ' ']" />
    <xsl:template match="*">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>