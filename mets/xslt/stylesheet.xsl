<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:mods="http://www.loc.gov/mods/v3" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:template match="/">
        <html>
        <table>
            <xsl:apply-templates select="//mods:mods/descendant::*" />
        </table>
        </html>
    </xsl:template>
    <xsl:template match="*">
         <xsl:variable name="alphanum" select=
 "'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'"/>

        <xsl:variable name="text" select="text()" />
        <xsl:variable name="ln" select="local-name()" />
        <xsl:variable name="count" select="count(//mods:mods/descendant::*[text() = $text and local-name() = $ln])" />
        <xsl:if test="string-length($text) != string-length(translate($text,$alphanum,'')) and $count > 1">
            <tr>
                <td><xsl:value-of select="$ln" /></td>
                <td><xsl:value-of select="normalize-space($text)" /></td>
                <td><xsl:value-of select="$count" /></td>
            </tr>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>