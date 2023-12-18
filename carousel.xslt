<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
>
	<xsl:template match="*[data]">
		<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
			<script>
				<![CDATA[
			for (let target of document.querySelectorAll(".carousel")) {
				let carousel = bootstrap.Carousel.getOrCreateInstance(target);
				carousel.cycle();
			}
			
		]]>
			</script><style>
				<![CDATA[
			.carousel img {
				top: -150px;
				position: relative;
			}
			]]>
			</style>
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<xsl:apply-templates mode="carousel-item" select="data"/>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</xsl:template>

	<xsl:template match="*" mode="carousel-item">
		<div class="carousel-item active">
			<img src="/images/cover_0{position()}.jpg" style="width:100%"/>
			<div class="container">
				<div class="carousel-caption text-start">
					<h1>Inteligencia de Negocios.</h1>
					<p class="opacity-75">Libera el poder de la información.</p>
					<!--<p>
						<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
					</p>-->
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>