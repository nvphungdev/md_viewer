# MD Viewer

Native macOS markdown viewer built with SwiftUI and [MarkdownUI](https://github.com/gonzalezreal/swift-markdown-ui).

Fast, document-based reader for `.md` files with themed rendering, outline navigation, and live filtering.

## Features

- GitHub Flavored Markdown rendering
- Document outline sidebar (heading navigation)
- Multiple themes + system dark mode
- Adjustable font size
- In-document text filter
- Native document-based app (open, recents, multi-window)

## Requirements

- macOS 14 (Sonoma) or later
- Xcode 15+
- [XcodeGen](https://github.com/yonaskolb/XcodeGen)

## Build

```bash
brew install xcodegen          # one-time
xcodegen generate              # generates MDViewer.xcodeproj
open MDViewer.xcodeproj
```

Select the `MDViewer` scheme in Xcode and Run.

## Project Layout

```
Sources/MDViewer/    Swift sources
Sources/Resources/   assets, Info.plist
Documents/           architecture, design, ADRs
project.yml          XcodeGen spec
```

See [`Documents/Architecture.md`](Documents/Architecture.md), [`Documents/Design.md`](Documents/Design.md), and [`Documents/Decisions.md`](Documents/Decisions.md) for design notes.

## Roadmap

- FSEvents file watcher → auto-reload on external edit
- WKWebView fallback for Mermaid + KaTeX
- PDF export
- Tabs
- App Store signing + notarization

## Contributing

Issues and pull requests welcome. Please open an issue to discuss larger changes before submitting a PR.

## License

MIT — see [LICENSE](LICENSE).

## Bundle ID

`com.ploutonconsulting.mdviewer`
