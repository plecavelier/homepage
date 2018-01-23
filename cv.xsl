<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output omit-xml-declaration="no" indent="yes" method="html" encoding="utf-8"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:param name="year" />

	<xsl:template match="homepage">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title>Curriculum Vitae de Pierre Lecavelier</title>
				<meta http-equiv="content-type" content="text/html; charset=utf-8" />
				<link href="cv.css" rel="stylesheet" type="text/css" />
			</head>
			
			<body>
				<div class="cv">
					<xsl:apply-templates select="profile" />
					<xsl:apply-templates select="experiences[@fid = 'jobs']" />
					<xsl:apply-templates select="experiences[@fid = 'studies']" />
					<xsl:apply-templates select="competences[@fid = 'competences']" />
					<xsl:apply-templates select="competences[@fid = 'leisures']" />
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="profile">
		<div class="header">
			<div class="profile">
				<h2 class="name">
					<xsl:value-of select="name" />
				</h2>
				<div class="sep"></div>
				<p>
					<xsl:value-of select="nationality" />
				</p>
				<p>
					<xsl:value-of select="status" />
				</p>
				<p>
					<xsl:variable name="var1" select="$year" />
					<xsl:variable name="var2" select="birthyear" />
					<xsl:value-of select="$var1+(-$var2)+(-1)" />
					<xsl:text> ans</xsl:text>
				</p>
				<p>
					<xsl:value-of select="drive" />
				</p>
				<div class="sep"></div>
				<p>
					<xsl:value-of select="address/street" />
				</p>
				<p>
					<xsl:value-of select="address/code" />
					<xsl:text> </xsl:text>
					<xsl:value-of select="address/city" />
				</p>
				<p>
					<xsl:value-of select="mail" />
				</p>
				<p>
					<xsl:value-of select="phone" />
				</p>
			</div>
			<div class="photo">
				<img src="photos/{photo/@src}" alt="" />
			</div>
		</div>
	</xsl:template>

	<xsl:template match="experiences">
		<h1>
			<xsl:value-of select="title" />
		</h1>
		<xsl:for-each select="experience">
			<div class="experience">
				<div class="left">
					<p>
						<xsl:value-of select="start" />
						<xsl:text> à </xsl:text>
						<xsl:value-of select="stop" />
					</p>
				</div>
				<div class="right">
					<p class="description">
						<xsl:apply-templates select="description" />
					</p>
					<xsl:for-each select="details/detail">
						<xsl:if test="not(@inCv)">
							<div class="details">
								<xsl:if test="@length">
									<p class="length">
										<xsl:value-of select="@length" />
									</p>
								</xsl:if>
								<xsl:apply-templates select="." />
							</div>
						</xsl:if>
					</xsl:for-each>
				</div>
			</div>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="competences">
		<h1>
			<xsl:value-of select="title" />
		</h1>
		<div class="competences">
			<ul>
				<xsl:for-each select="competence">
					<li>
						<xsl:apply-templates select="." />
					</li>
				</xsl:for-each>
			</ul>
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