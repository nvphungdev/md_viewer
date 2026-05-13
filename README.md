# MD Viewer

Native macOS markdown viewer. SwiftUI + [MarkdownUI](https://github.com/gonzalezreal/swift-markdown-ui).

## Build

```bash
brew install xcodegen          # one-time
xcodegen generate              # generates MDViewer.xcodeproj
open MDViewer.xcodeproj
```

Then in Xcode: select `MDViewer` scheme → Run.

## Status

MVP. Renders GFM, dark mode follows system, font-size stepper, theme picker, in-doc filter.

## Roadmap

- File watcher → auto-reload on external edit (FSEvents)
- WKWebView fallback for Mermaid + KaTeX
- PDF export
- Tabs
- Outline sidebar
- App Store sign + notarize

## Bundle ID

`za.co.plouton.mdviewer`
