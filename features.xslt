<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
>
	<xsl:template match="data">
		<div class="row featurette">
			<div>
				<xsl:apply-templates mode="feature-header-class" select="."/>
				<h2 class="featurette-heading fw-normal lh-1">
					<xsl:value-of select="substring-before(@name,'.')"/>. <span class="text-body-secondary">
						<xsl:value-of select="substring-after(@name,'.')"/>
					</span>
				</h2>
				<p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
			</div>
			<div>
				<xsl:apply-templates mode="feature-body-class" select="."/>
				<svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
					<title>Placeholder</title>
					<rect width="100%" height="100%" fill="var(--bs-secondary-bg)" />
					<text x="50%" y="50%" fill="var(--bs-secondary-color)" dy=".3em">500x500</text>
				</svg>
			</div>
		</div>

		<hr class="featurette-divider"/>
	</xsl:template>

	<xsl:template match="data" mode="feature-header-class">
		<xsl:attribute name="class">col-md-7</xsl:attribute>
	</xsl:template>

	<xsl:template match="data" mode="feature-body-class">
		<xsl:attribute name="class">col-md-5</xsl:attribute>
	</xsl:template>
</xsl:stylesheet>