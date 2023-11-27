<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
>
	<xsl:template match="/*">
		<menu class="navbar-nav me-auto mb-2 mb-md-0">
			<xsl:apply-templates mode="menu-item" select="*"/>
		</menu>
	</xsl:template>

	<xsl:template mode="menu-item" match="*">
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="#{name()}">
				<xsl:value-of select="name()"/>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet>