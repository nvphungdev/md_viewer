# UI Design Principles

## Guiding Principles

1. **Content first.** The rendered markdown is the entire product. Chrome (toolbars, sidebars) should be invisible until needed.
2. **Native macOS.** Use system controls, system fonts, and system behaviours. Model the visual language after macOS Preview.
3. **Readable by default.** Line length, spacing, and type size should produce a comfortable reading experience without user configuration.
4. **Zero setup.** Open a file and start reading. No preferences to configure, no account to create.

---

## Layout

### Background
The scroll view background uses `NSColor.underPageBackgroundColor` — the same medium-gray used by macOS Preview and TextEdit in page-layout mode. This creates immediate visual separation between the app chrome and the document content.

### Page Card
Markdown content is rendered on a white "page" card (adapts to dark mode via `NSColor.controlBackgroundColor` in dark), with:
- **Max width:** 820 pt — prevents excessively long lines on wide displays
- **Inner padding:** 40 pt on all sides — breathing room inside the page
- **Corner radius:** 2 pt — barely-there rounding, like a real page edge
- **Drop shadow:** `radius: 8, y: 2`, opacity 15% (light) / 40% (dark)
- **Outer margin:** 28 pt vertical, 24 pt horizontal

```
┌─────────────────────────────────────────────┐
│  [underPageBackgroundColor]                  │
│    ┌───────────────────────────────────┐     │
│    │  [white page — max 820pt]         │     │
│    │                                   │     │
│    │    40pt inner padding             │     │
│    │    ┌ Markdown content ┐           │     │
│    │    └──────────────────┘           │     │
│    │                                   │     │
│    └───────────────────────────────────┘     │
│              drop shadow                     │
└─────────────────────────────────────────────┘
```

The page card is centred horizontally in the scroll view at all window widths.

---

## Toolbar

The standard macOS toolbar contains all controls (right / primary-action side):

| Control | Symbol | Behaviour |
|---|---|---|
| Decrease text size | `textformat.size.smaller` | Reduces `fontSize` by 1pt, min 10pt |
| Increase text size | `textformat.size.larger` | Increases `fontSize` by 1pt, max 28pt |
| Theme picker | — | Menu: GitHub / DocC / Basic |
| Share | `square.and.arrow.up` | `ShareLink` with document text |
| Search | (system `.searchable`) | ⌘F; filters visible lines |

Toolbar icon buttons use `.help()` for tooltip disclosure. Steppers are avoided — individual buttons match macOS Preview's zoom control pattern.

---

## Dark Mode

| Element | Light | Dark |
|---|---|---|
| Scroll background | `underPageBackgroundColor` (~gray) | `underPageBackgroundColor` (~dark gray) |
| Page background | `.white` | `NSColor.controlBackgroundColor` |
| Shadow | 15% black | 40% black |

Colour values are computed via `@Environment(\.colorScheme)` so transitions are automatic.

---

## Typography

| Element | Value |
|---|---|
| Default font size | 14 pt |
| Adjustable range | 10 – 28 pt |
| All elements scale | `markdownTextStyle { FontSize(fontSize) }` proportionally scales headings and body |
| Line measure | Constrained by 820 pt page (actual measure ~740 pt after padding) |

---

## Accessibility

- All rendered text is selectable (`.textSelection(.enabled)`).
- Font size control is independent of system accessibility text-size settings.
- Colour contrast and focus inherited from the active theme.
- Search (⌘F) is keyboard-accessible and respects system focus rings.
- Toolbar buttons have `.help()` tooltips for discoverability.

---

## Window Behaviour

- One window per document (macOS `DocumentGroup` model).
- Window title set automatically from the file name.
- No imposed minimum window size; page card collapses gracefully on narrow windows.
