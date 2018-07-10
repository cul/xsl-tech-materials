<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:template match="/">
        <html>
            <dl>
                <xsl:for-each select="./oai_dc:dc/*">
                    <xsl:call-template name="dce" />
                </xsl:for-each>
            </dl>
        </html>
    </xsl:template>
    <xsl:template name="dce">
        <xsl:variable name="ln" select="local-name()" />
        <xsl:variable name="ps" select="preceding-sibling::*[local-name() = $ln]" />
        <xsl:variable name="fs" select="following-sibling::*[local-name() = $ln]" />
        <xsl:if test="count($ps) = 0">
            <dt><xsl:value-of select="local-name()" /></dt>
            <xsl:choose>
                <xsl:when test="count($fs) != 0">
                    <dd>
                        <ul>
                            <li><xsl:value-of select="text()" /></li>
                            <xsl:for-each select="following-sibling::*[local-name() = $ln]">
                                <li><xsl:value-of select="text()" /></li>
                            </xsl:for-each>
                        </ul>
                    </dd>
                </xsl:when>
                <xsl:otherwise>
                    <dd><xsl:value-of select="text()" /></dd>
                </xsl:otherwise>
            </xsl:choose>        
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>