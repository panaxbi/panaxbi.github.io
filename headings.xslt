<!DOCTYPE stylesheet [
	<!ENTITY raquo "&#187;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:searchParams="http://panax.io/site/searchParams"
xmlns="http://www.w3.org/1999/xhtml"
>
	<xsl:param name="searchParams:lang"></xsl:param>

	<xsl:template match="*[data]">
		<script>
			<![CDATA[
                xover.listener.on(['searchParams?lang','popstate'], function () {
                    xo.sources["#headings"].replaceChildren();
					xo.sources["#headings"].ready;
                })
            ]]>
		</script>
		<div class="row" style="position:relative">
			<script>
				particlesJS('particles-js-<xsl:value-of select="generate-id()"/>', config);
			</script>
			<div id="particles-js-{generate-id()}" class="particles"></div>
			<xsl:apply-templates mode="heading" select="data">
				<xsl:sort data-type="number" select="comment"/>
			</xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template mode="heading" match="data">
		<div class="col-lg-4">
			<xsl:apply-templates mode="heading-image" select="."/>
			<h2 class="fw-normal">
				<xsl:value-of select="@name"/>
			</h2>
			<p>
				<xsl:value-of select="value"/>
			</p>
			<p>
				<a class="btn btn-secondary" href="#feature-{position()}" scroll-restoration="manual">Ver más &raquo;</a>
			</p>
		</div>
	</xsl:template>

	<xsl:template match="data" mode="heading-image">
		<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid slice" focusable="false">
			<title>Placeholder</title>
			<rect width="100%" height="100%" fill="var(- -bs-secondary-color)" />
		</svg>
	</xsl:template>

	<xsl:template match="data[comment]" mode="heading-image">
		<div>
			<img class="circle" src="/images/{comment}"/>
		</div>
	</xsl:template>

	<xsl:template match="data" mode="heading-header-class">
		<xsl:attribute name="class">col-md-7</xsl:attribute>
	</xsl:template>

	<xsl:template match="data[comment mod 2=0]" mode="heading-header-class">
		<xsl:attribute name="class">col-md-7 order-md-2</xsl:attribute>
	</xsl:template>

	<xsl:template match="data" mode="heading-body-class">
		<xsl:attribute name="class">
			<xsl:text>col-md-5 </xsl:text>
			<xsl:if test="count(preceding-sibling::data) mod 2 = 1">
				<xsl:text/>order-md-1<xsl:text/>
			</xsl:if>
		</xsl:attribute>
	</xsl:template>
</xsl:stylesheet>