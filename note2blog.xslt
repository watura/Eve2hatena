<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="en-note">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="div">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="br">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="en-media">
    <xsl:choose>
      <xsl:when test="contains(@type, 'image/png')">
        <img>
          <xsl:attribute name="class">attach_img</xsl:attribute>
          <xsl:attribute name="src">
            <xsl:value-of select="concat('/images/', @hash, '.png')" />
          </xsl:attribute>
        </img>
      </xsl:when>
      <xsl:when test="contains(@type, 'image/jpeg')">
        <img>
          <xsl:attribute name="class">attach_img</xsl:attribute>
          <xsl:attribute name="src">
            <xsl:value-of select="concat('/images/', @hash, '.jpg')" />
          </xsl:attribute>
        </img>
      </xsl:when>
      <xsl:otherwise>
        Unknown media: 
        <xsl:value-of select="@type" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="* | @* | text()">
    <xsl:copy>
      <xsl:apply-templates select="* | @* | text()" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>