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
                <nav class="vertical-nav">
                    <ul>
                        <li><a href="index.html">Splash Page</a></li>
                        <li><a href="welcome.html" class="active">Project Overview</a></li>
                        <li><a href="steps.html">Cake &amp; Frosting Steps</a></li>
                        <li><a href="recipe.html">Curated Recipe</a></li>
                    </ul>
                </nav>
                <h1>Gram’s German Chocolate Cake</h1>
                <xsl:apply-templates select="descendant::recipe"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="recipe">
        <section class="recipe">
            <h2><xsl:value-of select="@name"/></h2>
            <h3>Serves <xsl:apply-templates select="@serves"/></h3>
            <xsl:apply-templates/>
        </section> 
    </xsl:template>
    <xsl:template match="metadata">
        <!-- Pulling the descriptive info in the <source> element here. -->
        <div class="source">
        <xsl:apply-templates select="source"/>
        </div>
    </xsl:template>
    
    <!-- Equipment Section -->
    <xsl:template match="equipment">
        <section class="equipment">
            <h3>Equipment</h3>
            <ul>
                <xsl:apply-templates select="tool"/>
            </ul>
        </section>
    </xsl:template>
    
    <!-- Ingredient Section -->
    <xsl:template match="ingredient">
        <section class="ingredient">
            <h3>Ingredients</h3>
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
    
    
    <!-- Instructions -->
    <!--
        This template finds the <instructions> section in my XML file.
        It turns that into an HTML <section> with a class called "instructions" so I can style it later.
        The <h3> tag creates a heading that says “Instructions”.
        The <ol> tag starts an ordered list so each recipe step is numbered automatically.
        The xsl:apply-templates select="step" tells XSLT to go look for all <step> elements inside <instructions>
        and process each one using the next template below.
    -->
    <xsl:template match="instructions">
        <section class="instructions">
            <h3>Instructions: <xsl:apply-templates select="ancestor::recipe/@name"/></h3>
           
            <ol>
                <xsl:apply-templates/>
            </ol>
        </section>
    </xsl:template>

    <!-- Each step -->
    <!--
        This template matches every <step> element inside the instructions.
        It wraps each step in an <li> tag so it shows up as a numbered list item.
        Inside each <li>, it runs two more templates:
        one for the <instruction> (the text directions)
        and one for <photo> (the image that goes with that step).
        This way, each step shows both the written directions and its matching photo.
    -->
    <xsl:template match="step">
        <li>
            <xsl:apply-templates/>

        </li>
    </xsl:template>

    <!-- Instruction text -->
    <!--
        This template handles the <instruction> elements inside each step.
        It puts the text directions inside a <p> tag to format them in HTML.
        The xsl:apply-templates line used here, any smaller pieces of markup inside the instruction
        (like <tool> or <ing> references) will also get processed correctly by their own templates.
    -->
    <xsl:template match="instruction">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    
    <!-- Photos -->
    <!--
        This template finds every <photo> element in my XML file.
        It turns each one into an HTML <figure> with an <img> inside it so I can style it with CSS.
        The "replace()" function cleans up the file path by taking out "../docs/"
        so the image links work correctly when viewed in the browser.
        The alt text adds a short description (“Step photo”) to make the image accessible.
    -->
    <xsl:template match="vis">
        <section class="photo-row">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="photo">
        <figure>
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="replace(@target, '../docs/', '')"/>
                </xsl:attribute>
                <xsl:attribute name="alt">Step photo</xsl:attribute>
            </img>
        </figure>
    </xsl:template>
    
    <!-- Notes and editorial notes -->
    <!--
        This template matches both <editorialNote> and <note> elements.
        It changes them into an HTML <aside> element, which is used for side comments or extra info.
            I had to spend a good time finding out how to use this propperly and have the links I used
            for that purpose
        The <strong> and <a> tags show who wrote the note by using the @resp attribute from the XML.
        The href links that person’s ID so it connects to their info inside the page.
        xsl:apply-templates makes sure the actual note text shows up after the name.
    -->
    <xsl:template match="editorialNote | note">
        <xsl:choose>
            <xsl:when test="@resp">
            <aside>
            <strong>
                <a>
                    <xsl:attribute name="href">
                        <xsl:text>people.html#</xsl:text>
                        <!-- ebb: This is setting up a relative link
                        to a people.html page where you'll store elements
                        with @id attributes that help introduce everyone!
                        
                        <figure id="njk">
                            <img src="higrammy.JPG" alt="hi there!"/>
                            <figcaption>My awesome caption</figcaption>
                        </figure>
                        -->
                        <xsl:value-of select="@resp"/>
                    </xsl:attribute>
                    <xsl:value-of select="@resp"/>
                </a>
            </strong>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
        </aside>
            </xsl:when>
            <xsl:otherwise>
                <aside>
                    <strong>
                        <a>
                            <xsl:attribute name="id">
                                <xsl:text>people.html#</xsl:text>
                                <!-- ebb: This is setting up a relative link
                        to a people.html page where you'll store elements
                        with @id attributes that help introduce everyone!
                        
                        <figure id="njk">
                            <img src="higrammy.JPG" alt="hi there!"/>
                            <figcaption>My awesome caption</figcaption>
                        </figure>
                        -->
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:value-of select="@xml:id"/>
                        </a>
                    </strong>
                    <xsl:text> </xsl:text>
                    <xsl:apply-templates/>
                </aside>
                
               
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Temperature and timespan -->
    <!--
        These templates handle smaller details that show up inside my recipe steps.
        They turn <temperature> and <timespan> into <span> tags so I can style them separately.
        For <temperature>, it prints the number, adds the degree symbol (°), 
        and then shows the unit (like F for Fahrenheit).
        For <timespan>, it prints the time value and the unit (like “minutes”).
        xsl:value-of select="." is what actually grabs the text from the XML to display it.
    -->
    <xsl:template match="temperature">
        <span class="temp">
            <xsl:value-of select="."/>
            <xsl:text>°</xsl:text>
            <xsl:value-of select="@unit"/>
        </span>
    </xsl:template>

    <xsl:template match="timespan">
        <span class="time">
            <xsl:value-of select="."/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="@unit"/>
        </span>
    </xsl:template>

</xsl:stylesheet>