<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns="http://www.tei-c.org/ns/1.0" version="1.1">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html><table>
            <xsl:for-each select="//ns:publicationStmt/*">
                <xsl:if test="count(*) = 0">
                    <tr>
                        <th><xsl:value-of select="name()" /></th>
                        <td><xsl:value-of select="." /></td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </table></html>
    </xsl:template>
</xsl:stylesheet>