<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:searchParams="http://panax.io/site/searchParams"
xmlns="http://www.w3.org/1999/xhtml"
>
	<xsl:param name="searchParams:lang"></xsl:param>

	<xsl:template match="*[data]">
		<script>
			<![CDATA[
                xover.listener.on(['searchParams?lang','popstate'], function () {
                    xo.sources["#features"].replaceChildren();
					xo.sources["#features"].ready;
                })
            ]]>
		</script>
		<div class="container">
			<xsl:apply-templates mode="feature" select="data">
				<xsl:sort data-type="number" select="comment"/>
			</xsl:apply-templates>
		</div>
	</xsl:template>

	<xsl:template mode="feature" match="data">
		<div id="feature-{position()}" class="row" style="position:relative">
			<script>particlesJS('particles-js-feature-<xsl:value-of select="generate-id()"/>', config);</script>
			<div id="particles-js-feature-{generate-id()}" class="particles" style="background-color:transparent"></div>
			<div class="featurette">
				<xsl:apply-templates mode="feature-header-class" select="."/>
				<h2 class="featurette-heading fw-normal lh-1">
					<xsl:value-of select="substring-before(@name,'.')"/>. <span class="text-body-secondary">
						<xsl:value-of select="substring-after(@name,'.')"/>
					</span>
				</h2>
				<p class="lead">
					<xsl:value-of select="value"/>
				</p>
			</div>
			<div>
				<xsl:apply-templates mode="feature-body-class" select="."/>
				<img src="/images/feature_0{position()}.jpg" style="height:500px; width: auto;"/>
			</div>
		</div>

		<hr class="featurette-divider"/>
	</xsl:template>

	<xsl:template match="data" mode="feature-header-class">
		<xsl:attribute name="class">col-md-7</xsl:attribute>
	</xsl:template>

	<xsl:template match="data[comment mod 2=0]" mode="feature-header-class">
		<xsl:attribute name="class">col-md-7 order-md-2</xsl:attribute>
	</xsl:template>

	<xsl:template match="data" mode="feature-body-class">
		<xsl:attribute name="class">
			<xsl:text>col-md-5 </xsl:text>
			<xsl:if test="count(preceding-sibling::data) mod 2 = 1">
				<xsl:text/>order-md-1<xsl:text/>
			</xsl:if>
		</xsl:attribute>
	</xsl:template>
</xsl:stylesheet>