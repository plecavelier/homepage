<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output omit-xml-declaration="yes" indent="yes" method="html" encoding="utf-8" />

	<xsl:param name="year" />

	<xsl:template match="homepage">
		<div class="menu">
			<ul>
				<li><a href="#profile" data-scroll-link="">Profil</a></li>
				<li><a href="#{experiences[@fid = 'jobs']/@fid}" data-scroll-link=""><xsl:value-of select="experiences[@fid = 'jobs']/title" /></a></li>
				<li><a href="#{experiences[@fid = 'studies']/@fid}" data-scroll-link=""><xsl:value-of select="experiences[@fid = 'studies']/title" /></a></li>
				<li><a href="#{competences[@fid = 'competences']/@fid}" data-scroll-link=""><xsl:value-of select="competences[@fid = 'competences']/title" /></a></li>
				<li><a href="#{competences[@fid = 'leisures']/@fid}" data-scroll-link=""><xsl:value-of select="competences[@fid = 'leisures']/title" /></a></li>
			</ul>
			<div class="print"><a href="javascript:void(0)" onClick="window.print()">Imprimer</a></div>
		</div>
		<xsl:apply-templates select="profile" />
		<xsl:apply-templates select="experiences[@fid = 'jobs']" />
		<xsl:apply-templates select="experiences[@fid = 'studies']" />
		<xsl:apply-templates select="competences[@fid = 'competences']" />
		<xsl:apply-templates select="competences[@fid = 'leisures']" />
	</xsl:template>

	<xsl:template match="profile">
		<div id="profile" class="mainBlock profile">
			<div class="photo">
				<img src="{photo/@src}" alt="" />
			</div>
			<h1 class="title">
				<xsl:value-of select="name" />
			</h1>
			<h2 class="profession">
				<xsl:value-of select="profession" />
			</h2>
			<div class="infos">
				<ul>
					<li style="background-image: url('{nationality/@icon}')">
						<xsl:value-of select="nationality" />
					</li>
					<li style="background-image: url('{status/@icon}')">
						<xsl:value-of select="status" />
					</li>
					<li style="background-image: url('{birthyear/@icon}')">
						<xsl:variable name="var1" select="$year" />
						<xsl:variable name="var2" select="birthyear" />
						<xsl:value-of select="$var1+(-$var2)+(-1)" />
						<xsl:text> ans</xsl:text>
					</li>
					<li style="background-image: url('{drive/@icon}')">
						<xsl:value-of select="drive" />
					</li>
				</ul>
				<ul>
					<li style="background-image: url('{address/@icon}')">
						<xsl:value-of select="address/street" />
					</li>
					<li>
						<xsl:value-of select="address/code" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="address/city" />
					</li>
					<li style="background-image: url('{mail/@icon}')">
						<a href="mailto:{mail}">
							<xsl:value-of select="mail" />
						</a>
					</li>
					<li style="background-image: url('{phone/@icon}')">
						<xsl:value-of select="phone" />
					</li>
				</ul>
			</div>
			<div class="links noprint">
				<xsl:for-each select="links/link">
					<a href="{url}" target="_blank" style="background-image: url('{icon}')">
						<img src="{icon}" title="{label}" alt="" />
					</a>
				</xsl:for-each>
			</div>
			<div class="website">
				<p>Page source : http://pierre.crashdump.net/</p>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="experiences">
		<div id="{@fid}" class="mainBlock experiences">
			<h3 class="title">
				<xsl:value-of select="title" />
			</h3>
			<xsl:for-each select="experience">
				<div class="experience">
					<div class="left">
						<div class="dates">
							<p>
								<xsl:if test="not(stop)">
									<xsl:text>Depuis </xsl:text>
								</xsl:if>
								<xsl:value-of select="start" />
								<xsl:if test="stop">
									<xsl:text> à </xsl:text>
									<xsl:value-of select="stop" />
								</xsl:if>
							</p>
						</div>
						<xsl:if test="logo">
							<div class="logo {logo/@class}">
								<img src="{logo}" alt="" width="{logo/@width}"/>
							</div>
						</xsl:if>
					</div>
					<div class="right">
						<div class="description">
							<p>
								<xsl:apply-templates select="description" />
							</p>
						</div>
						<xsl:for-each select="details/detail">
							<div class="details {@class}">
								<xsl:if test="@length">
									<p class="length">
										<xsl:value-of select="@length" />
									</p>
								</xsl:if>
								<xsl:apply-templates select="." />
							</div>
						</xsl:for-each>
					</div>
				</div>
			</xsl:for-each>
		</div>
	</xsl:template>

	<xsl:template match="competences">
		<div id="{@fid}" class="mainBlock competences">
			<h3 class="title">
				<xsl:value-of select="title" />
			</h3>
			<div class="left">
				<img src="{logo}" alt="" width="{logo/@width}" />
			</div>
			<div class="right">
				<ul>
					<xsl:for-each select="competence">
						<li>
							<p><xsl:apply-templates select="." /></p>
						</li>
					</xsl:for-each>
				</ul>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="text()">
		<xsl:value-of select="." />
	</xsl:template>

	<xsl:template match="a">
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match="p">
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match="ul">
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match="li">
		<xsl:copy-of select="." />
	</xsl:template>

	<xsl:template match="b">
		<xsl:copy-of select="." />
	</xsl:template>

</xsl:stylesheet>