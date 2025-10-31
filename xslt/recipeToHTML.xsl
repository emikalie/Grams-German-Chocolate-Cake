<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
               <title><xsl:value-of select="descendant::recipe[1]/@name"/></title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <h1>Gram’s German Chocolate Cake</h1>
                <nav class="vertical-nav">
                    <ul>
                        <li><a href="index.html">Splash Page</a></li>
                        <li><a href="welcome.html" class="active">Project Overview</a></li>
                        <li><a href="steps.html">Cake &amp; Frosting Steps</a></li>
                        <li><a href="recipe.html">Curated Recipe</a></li>
                    </ul>
                </nav>
                <xsl:apply-templates select="descendant::recipe"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="recipe">
        <section class="recipe">
            <h2><xsl:value-of select="@name"/></h2>
            <xsl:apply-templates/>
        </section> 
    </xsl:template>
    <xsl:template match="metadata">
        <!-- Let's just pull the descriptive info you're supplying in the <source> element here. -->
        <div class="source">
        <xsl:apply-templates select="source"/>
        </div>
    </xsl:template>
    
    <xsl:template match="equipment | ingredient">
        <section class="{name()}">
            <ul>
                <xsl:apply-templates/>           
           </ul>
        </section>
        
    </xsl:template>
    <xsl:template match="equipment/tool">
        <xsl:element name="li">
            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@ref">
                <xsl:attribute name="href">
                    <xsl:value-of select="'#'||@ref"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
            
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ingredient/item">
        <xsl:element name="li">
            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@ref">
                <xsl:attribute name="href">
                    <xsl:value-of select="'#'||@ref"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:for-each select="@*[not(name() = 'xml:id') and not(name() = 'ref')]">
                <xsl:attribute name="data-{name()}">
                    <xsl:value-of select="current()"/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates/>
           
        </xsl:element>
    </xsl:template>
    
   <!-- ebb: Continue writing template rules to output HTML structures. 
   We want to try to make @resp attributes be href internal link pointers
   like I did with the @ref attributes. Anything with an xml:id turns into 
   an @id in HTML and is the target of an internal link.
   
   When you output your steps, try outputting the <ol> so that the 
   <li> elements coming out inside will be numbers.
   
   Work on the CSS as you're developing the shape of this output!
   -->

</xsl:stylesheet>