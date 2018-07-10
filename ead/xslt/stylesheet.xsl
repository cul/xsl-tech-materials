<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- NB this is an XSLT2 stylesheet -->
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:template match="/">
        <results>
            <xsl:for-each-group select="//unitdate" group-by="@normal">
        
                <xsl:for-each select="current-group()">
                    <result>
                        <normal><xsl:value-of select="@normal"/></normal>
                        <data><xsl:value-of select="count(current-group())"/></data>
                    </result>
                </xsl:for-each>
            </xsl:for-each-group>
        </results>
    </xsl:template>
    <xsl:template match="*" />
</xsl:stylesheet>
