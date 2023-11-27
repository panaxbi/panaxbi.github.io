﻿<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
>
	<xsl:template match="/*">
		<menu class="navbar-nav me-auto mb-2 mb-md-0">
			<xsl:apply-templates mode="menu-item" select="*"/>
		</menu>
	</xsl:template>

	<xsl:template match="*" mode="menu-item">
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="#{name()}">
				<xsl:copy-of select="@href"/>
				<xsl:apply-templates mode="menu-item-label" select="."/>
			</a>
		</li>
	</xsl:template>

	<xsl:template match="*" mode="menu-item-label">
		<xsl:value-of select="name()"/>
	</xsl:template>

	<xsl:template match="financieros" mode="menu-item-label">
		<xsl:text>Reportes Financieros</xsl:text>
	</xsl:template>

	<xsl:template match="operativos" mode="menu-item-label">
		<xsl:text>Reportes Operativos</xsl:text>
	</xsl:template>

	<xsl:template match="home" mode="menu-item-label">
		<xsl:text>Home</xsl:text>
	</xsl:template>
</xsl:stylesheet>