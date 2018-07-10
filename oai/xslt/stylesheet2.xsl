<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" dc="http://purl.org/dc/elements/1.1/" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/html">
        <oai_dc:dc>
          <xsl:apply-templates select="body/*" />
        </oai_dc:dc>
    </xsl:template>
    <xsl:template match="p">
        <dc:description>
            <xsl:for-each select="child::text()">
                <xsl:call-template name="text" />
            </xsl:for-each>
        </dc:description>
        <xsl:apply-templates select="./*" />
    </xsl:template>
    <xsl:template match="span[@class = 'title']">
        <dc:title><xsl:value-of select="." /></dc:title>
    </xsl:template>
    <xsl:template match="*" />
    <xsl:template name="text">
        <xsl:value-of select="." />
    </xsl:template>
</xsl:stylesheet>