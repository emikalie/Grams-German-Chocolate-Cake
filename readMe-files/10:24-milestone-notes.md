# Grandma’s German Chocolate Cake:
#notes on what i did for this milestone

---

## Splash Page (`index.html`)
**Changes made:**
- Fixed `<nav>` placement (moved out of `<head>` and into `<body>`).
- Created **top-centered horizontal navigation bar** (`.top-nav`).
- Made sure the **“Enter” button** links correctly to `Welcome.html`.
- Centered all splash content and ensured it displays below the top nav.
- Confirmed images inside `assets/cake/` load properly.
- Added responsive scaling for splash images.

**CSS Adjustments:**
- Added `.top-nav` styles for a horizontal layout.
- Added `margin-top: 100px` to `.splash-container` to prevent overlap.
- Kept hover magnifying-glass zoom effect for splash images.

---

## Welcome Page (`Welcome.html`)
**Changes made:**
- Created this welcome page
- Added new page layout with:
  - Title, descriptive paragraphs, and image row.
  - Vertical sidebar navigation linking to Splash and Steps pages.
- Added three display images.
- Added matching “magnifying zoom” hover effect for images.
- Made sure all content is visible (removed `height: 100vh` flex centering issue).

**CSS Adjustments:**
- Added `.welcome-container`, `.intro-section`, and `.photo-row` styles.
- Added smooth zoom hover effect identical to splash page.
- Added responsive protection (`@media` query) to reduce zoom scale on mobile.

---

## Steps Page (`Steps.html`)
**Changes made:**
- Created this steps page 
- Cleaned structure and removed messy/duplicate video sections.
- Added clear section separation:
  - “Cake Preparation Steps”
  - “Frosting Preparation Steps”
- Added navigation links to return to Welcome or Splash pages.
- Double checked all videos reference correct paths in `assets/videos/`.

**CSS Adjustments:**
- Added `.steps-container`, `.steps-header`, `.step`, and video styling.
- Created consistent box shadows, padding, and color palette.
- Double checked all videos auto-scale to fit within layout (max width 700px).

---

## Entier Site CSS Cleanup Summary

Added new responsive and layout improvements:
- `@media (max-width: 600px)` → prevents over-zoom on mobile.
- Improved organization with clear comment sections:
  - `/* SPLASH PAGE */`
  - `/* WELCOME PAGE */`
  - `/* STEPS PAGE */`
  - `/* NAVIGATION */`

Navigation consistency:
- `.top-nav` → horizontal for index (splash page)
- `.vertical-nav` → vertical for all interior pages




