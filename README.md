# MD Viewer

Native macOS markdown viewer built with SwiftUI and [MarkdownUI](https://github.com/gonzalezreal/swift-markdown-ui).

Fast, document-based reader for `.md` files with themed rendering, outline navigation, and live filtering.

## Install

### Homebrew (recommended)

```bash
brew tap ploutonconsulting/tap
brew install --cask mdviewer
```

Update later with `brew upgrade --cask mdviewer`.

### Manual

1. Grab the latest `MDViewer-<version>.zip` from [Releases](https://github.com/ploutonconsulting/md_viewer/releases/latest).
2. Unzip and drag `MDViewer.app` into `/Applications`.

Releases are signed with a Developer ID and notarized by Apple — Gatekeeper opens them directly.

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

## Contributing

Issues and pull requests welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for setup, conventions, and PR expectations. Participation is governed by the [Code of Conduct](CODE_OF_CONDUCT.md). Security issues: see [SECURITY.md](SECURITY.md).

Good places to start: issues tagged [`good first issue`](https://github.com/ploutonconsulting/md_viewer/labels/good%20first%20issue) and [`help wanted`](https://github.com/ploutonconsulting/md_viewer/labels/help%20wanted).

## Privacy

MD Viewer collects nothing and makes no network requests. See [PRIVACY.md](PRIVACY.md) for the full policy.

## License

MIT — see [LICENSE](LICENSE).

## Bundle ID

`com.ploutonconsulting.mdviewer`
