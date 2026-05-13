# Architecture

## Overview

MDViewer is a native macOS document viewer for Markdown files. It uses SwiftUI's `DocumentGroup` API to integrate directly with the macOS document model, enabling Finder open-with, drag-and-drop, and the standard file-opening experience without any custom file management code.

## Technology Stack

| Layer | Technology |
|---|---|
| UI Framework | SwiftUI |
| Markdown Rendering | [swift-markdown-ui](https://github.com/gonzalezreal/swift-markdown-ui) |
| Markdown Parser | cmark-gfm (via swift-markdown-ui) |
| Minimum OS | macOS 14 Sonoma |

## Application Pattern

The app follows a **document-based architecture** using `DocumentGroup`:

```
MDViewerApp (App entry point)
└── DocumentGroup (scene — one window per document)
    └── ContentView (view for a single document)
        └── MarkdownDocument (model — read-only FileDocument)
```

There is no shared app-level state. Each document window is fully independent.

## Key Components

### `MDViewerApp`
The `@main` entry point. Declares a `DocumentGroup` scene in view-only mode. Removes the New Item command (viewer only) and adds Sidebar and Toolbar commands.

### `MarkdownDocument`
Conforms to `FileDocument`. Accepts `.markdown` and `.plainText` UTTypes. Read-only — `fileWrapper(configuration:)` throws `CocoaError(.fileWriteNoPermission)` intentionally. Declares the custom UTType `net.daringfireball.markdown` as an imported type.

### `ContentView`
The document window view. Renders the markdown string through `MarkdownUI.Markdown`. Manages two pieces of persisted user preference via `@AppStorage`:
- `fontSize` — base font size (10–28 pt)
- `theme` — selected render theme name

Provides a toolbar with a font-size stepper and a theme picker, plus a search/filter bar that narrows visible lines by keyword.

### `Theme`
A simple enum mapping app theme cases (`gitHub`, `docC`, `basic`) to their `MarkdownUI.Theme` equivalents. Isolated in its own file per Swift one-type-per-file convention.

## File Structure

```
Sources/
└── MDViewer/
    ├── MDViewerApp.swift       — @main, DocumentGroup scene
    ├── MarkdownDocument.swift  — FileDocument model
    ├── ContentView.swift       — document window UI
    └── Theme.swift             — theme enum

Documents/
    ├── Architecture.md         — this file
    ├── Decisions.md            — architecture decision records
    ├── Design.md               — product & feature design
    └── UIDesign.md             — visual & interaction design principles
```

## Data Flow

```
File on disk
  → MarkdownDocument.init(configuration:)   [read from FileWrapper]
  → ContentView(document:)                  [renders document.text]
    → filtered (computed)                   [applies search filter]
    → Markdown(filtered)                    [MarkdownUI renders HTML-like tree]
```

User preferences (fontSize, theme) are read from `UserDefaults` via `@AppStorage` and apply immediately on change.
