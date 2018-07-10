<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mods="http://www.loc.gov/mods/v3" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:template match="/">
        <html>
        <table>
            <tr><th>Element</th><th>Error Code</th><th>Value</th></tr>
            <xsl:for-each select="descendant::*[not(node())]">
                <xsl:call-template name="debug">
                    <xsl:with-param name="errorCode" select="1" />
                </xsl:call-template>
            </xsl:for-each>
            <xsl:apply-templates select="//mods:identifier" />
        </table>
        </html>
    </xsl:template>
    <xsl:template name="debug">
        <xsl:param name="errorCode" />
        <tr>
            <td><xsl:value-of select="local-name()" /></td>
            <td><xsl:value-of select="$errorCode" /></td>
            <td><xsl:value-of select="child::text()" /></td>
        </tr>
    </xsl:template>
    <xsl:template match="mods:identifier[@type='local']">
        <xsl:variable name="identifier" select="text()" />
        <xsl:if test="count(//mods:url[contains(text(), $identifier)]) = 0">
            <xsl:call-template name="debug">
                <xsl:with-param name="errorCode" select="2" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template match="*" />
</xsl:stylesheet>