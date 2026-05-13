# Product Design

## Purpose

MDViewer is a focused, single-purpose tool: open a Markdown file and read it. Nothing more. It is not an editor, not a note-taking app, and not a wiki. The goal is to make reading Markdown files on macOS as frictionless as possible.

## Target Users

- Developers reading README files, changelogs, and documentation locally.
- Technical writers previewing Markdown before publishing.
- Anyone who wants a quick, clean preview of a `.md` file without opening a browser or code editor.

## Core Feature Set (v0.1)

| Feature | Description |
|---|---|
| Open & render | Open any `.md`, `.markdown`, `.mdown`, `.mkd`, `.mkdn` file via Finder, drag-and-drop, or the Open dialog |
| GFM rendering | Full GitHub Flavoured Markdown: headings, bold/italic/strikethrough, code blocks with syntax hints, tables, task lists, blockquotes, images |
| Theme switching | GitHub, DocC, and Basic themes selectable per session |
| Font size | Adjustable base font size (10–28 pt) |
| Search / filter | Keyboard-accessible search bar to filter visible lines |
| Text selection | All rendered text is selectable and copyable |
| Native integration | Appears in Open With, supports multiple windows, uses system title bar |

## Non-Goals (v0.1)

- Editing or saving files.
- Syntax highlighting in fenced code blocks (can be added later via a `CodeSyntaxHighlighter`).
- Side-by-side source/preview.
- Export to PDF or HTML.
- iOS / iPadOS support.

## Future Considerations

- **Syntax highlighting** — `swift-markdown-ui` supports a `CodeSyntaxHighlighter` protocol; Splash or Highlight.js could be integrated.
- **Outline / TOC sidebar** — parse headings and show a jump list.
- **In-place search highlighting** — replace the current line-filter approach with highlighted matches and next/previous navigation.
- **Extended format support** — AsciiDoc, reStructuredText, Org-mode (would require additional parsers).
- **Custom themes** — allow users to define their own colour scheme.
