# Relax NG Schema Notes for `grams-recipes.xml`

I made this file for myself so that I could have it as a point of reference as to why I did what I did in the schema. 

------------------------------------------------------------------------

## Top-Level Structure

-   **`start = element xml { ... }`**
    -   Defines the root element `<xml>` in your file.
    -   Inside, it requires exactly **three child sections**:
        -   `<metadata>`
        -   `<equipment>`
        -   `<recipes>`

------------------------------------------------------------------------

## Metadata Section

-   **`metadata = element metadata { ... }`**
    -   Holds information about the recipe's origins and contributors.
    -   `<source>` contains a free-text history plus an optional
        `<facs>` (points to an image facsimile).
    -   `<author>` and `<editor>` record contributors, each with unique
        IDs (`@xml:id`).
    -   Editors can also have a `@type` (like `"digitalArchivist"`).

------------------------------------------------------------------------

## Equipment Section

-   **`equipment = element equipment { ... }`**
    -   Contains one or more `<tool>` elements.
    -   Each `<tool>` must have a unique `@xml:id` (e.g., `"mixer"`,
        `"spatula"`).
    -   Lets you define all tools once, so later `<instructions>` can
        reference them by `@ref`.

------------------------------------------------------------------------

## Recipes Section

-   **`recipes = element recipes { recipe+ }`**
    -   Groups all recipes inside the document.
    -   Must have at least one `<recipe>`.

### Each Recipe

-   **`recipe = element recipe { ... }`**
    -   Attributes:
        -   `@name` = name of dish (e.g.,
            `"German sweet chocolate cake"`)
        -   `@serves` = what it yields (e.g., `"Cake"`, `"Frosting"`)
    -   Child content:
        -   `<notes>` 
        -   `<metadata>` 
        -   `<equipment>` 
        -   `<ingredients>` 
        -   `<instructions>` 

------------------------------------------------------------------------

## Ingredients

-   **`ingredients = element ingredients { ingredient+ }`**
    -   A list of one or more `<ingredient>` groups.
-   **`ingredient = element ingredient { ... }`**
    -   Attribute: `@type` categorizes the group (e.g., `"group_1"`,
        `"group_2"`).
    -   Child content can be:
        -   `<item>` = a single ingredient with quantity + unit.
        -   `<editorialNote>` = editor's comment on that ingredient
            group.
-   **`item = element item { ... }`**
    -   Attributes:
        -   `@xml:id` (unique ID) OR `@ref` (link to an existing
            ingredient/tool ID).
        -   `@quantity` (decimal or text, e.g., `2.5` or `"30-35"`)
        -   `@unit` (unit string, e.g., `"cup"`, `"tsp"`)
    -   Text = human-readable description (e.g.,
        `"2 1/2 cups sifted cake flour"`)
    -   Optional `<note>` = annotation, with `@resp` pointing back to
        the responsible person.

------------------------------------------------------------------------

## Editorial Notes

-   **`editorialNote = element editorialNote { ... }`**
    -   Used for editor commentary on steps or ingredients.
    -   Requires `@resp` (ID of the editor, e.g., `"eek"`).
    -   Text content = commentary itself.


