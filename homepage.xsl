<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output omit-xml-declaration="yes" indent="yes" method="html" encoding="utf-8" />

	<xsl:param name="year" />

	<xsl:template match="homepage">
		<div class="menu">
			<h1><a href="#profile">Profil</a></h1>
			<h1><a href="#{experiences[@fid = 'jobs']/@fid}"><xsl:value-of select="experiences[@fid = 'jobs']/title" /></a></h1>
			<h1><a href="#{experiences[@fid = 'studies']/@fid}"><xsl:value-of select="experiences[@fid = 'studies']/title" /></a></h1>
			<h1><a href="#{competences[@fid = 'competences']/@fid}"><xsl:value-of select="competences[@fid = 'competences']/title" /></a></h1>
			<h1><a href="#{competences[@fid = 'leisures']/@fid}"><xsl:value-of select="competences[@fid = 'leisures']/title" /></a></h1>
		</div>
		<xsl:apply-templates select="profile" />
		<xsl:apply-templates select="experiences[@fid = 'jobs']" />
		<xsl:apply-templates select="experiences[@fid = 'studies']" />
		<xsl:apply-templates select="competences[@fid = 'competences']" />
		<xsl:apply-templates select="competences[@fid = 'leisures']" />
	</xsl:template>

	<xsl:template match="profile">
		<div id="profile" class="mainBlock profile">
			<h1 class="name">
				<xsl:value-of select="name" />
			</h1>
			<h3 class="profession">
				<xsl:value-of select="profession" />
			</h3>
			<div class="infos">
				<div class="identity">
					<p style="background-image: url('{nationality/@icon}')">
						<xsl:value-of select="nationality" />
					</p>
					<p style="background-image: url('{status/@icon}')">
						<xsl:value-of select="status" />
					</p>
					<p style="background-image: url('{birthyear/@icon}')">
						<xsl:variable name="var1" select="$year" />
						<xsl:variable name="var2" select="birthyear" />
						<xsl:value-of select="$var1+(-$var2)+(-1)" />
						<xsl:text> ans</xsl:text>
					</p>
					<p style="background-image: url('{drive/@icon}')">
						<xsl:value-of select="drive" />
					</p>
				</div>
				<div class="contact">
					<p style="background-image: url('{address/@icon}')">
						<xsl:value-of select="address/street" />
					</p>
					<p>
						<xsl:value-of select="address/code" />
						<xsl:text> </xsl:text>
						<xsl:value-of select="address/city" />
					</p>
					<p style="background-image: url('{mail/@icon}')">
						<a href="mailto:{mail}">
							<xsl:value-of select="mail" />
						</a>
					</p>
					<p style="background-image: url('{phone/@icon}')">
						<xsl:value-of select="phone" />
					</p>
				</div>
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
			<div class="photo">
				<img src="photos/{photo/@src}" alt="" />
			</div>
		</div>
	</xsl:template>

	<xsl:template match="experiences">
		<div id="{@fid}" class="mainBlock experiences">
			<div class="title">
				<h1>
					<xsl:value-of select="title" />
				</h1>
			</div>
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
			<div class="title">
				<h1>
					<xsl:value-of select="title" />
				</h1>
			</div>
			<div class="left">
				<img src="{logo}" alt="" width="{logo/@width}" />
			</div>
			<div class="right">
				<ul>
					<xsl:for-each select="competence">
						<li>
							<xsl:apply-templates select="." />
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