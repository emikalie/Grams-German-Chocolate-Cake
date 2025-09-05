# Grams-German-Chocolate-Cake

This my proposal for my senior project:

A Digital Heritage Project
An interactive website that preserves, visualizes, and explores my grandma’s recipe through multiple lenses: history, ingredients, process, and family memory.
1. XML Data Backbone
Instead of just writing HTML text for the recipe, design an XML schema that can represent:
 Ingredients (`<ingredient>` with attributes like measurement, unit, type)
 Steps (`<step>` with difficulty/time attributes)
 Metadata (origin, grandma’s notes, occasions it was baked for)
 Versions (maybe compare grandma’s recipe with “official” German chocolate cake)

2. Interactive SVG Visuals
 Ingredient Map: A clickable SVG kitchen counter with ingredients as items - click an ingredient to see substitutions, history, or baking science behind it.
 Process Timeline: SVG-based flowchart of baking steps, animated as a timeline (mix - bake - frost).
 Cake Diagram: SVG layered cake diagram, each layer clickable to show frosting/filling details.

3. CSS & Design Choices
Style the site like a digital recipe card - aged paper textures, cursive fonts (for grandma’s handwriting feel).
 Use dark chocolate / caramel / cream color palette.
 Add subtle CSS animations (ingredients “fall” into a bowl when clicked, oven “glows” when cake is baking).

4. Family & Cultural Storytelling -Elevate the project beyond just a recipe
Include a mini digital exhibit on the history of German chocolate cake (did you know it’s actually an American recipe named after “German’s” brand of chocolate, not Germany?).
 Embed family stories - photos of grandma baking, scanned recipe cards, short audio clips of family talking about the cake.
 Compare grandma’s version with other published ones (visual side-by-side XML- HTML comparison).

5. Advanced Features to Show Off
Filtering / Scaling Recipes - Add input (e.g., “serve 8 people” - recipe scales automatically).
 Accessibility - Use  alt-text for images, and readable structure
 Optional - Add a “bake along” mode where users can click “Next Step” and a timer runs for that step.