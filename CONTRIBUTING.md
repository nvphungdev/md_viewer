# Contributing to MD Viewer

Thanks for your interest in contributing. This document explains how to get set up, the conventions used, and what to include in a pull request.

## Getting Started

1. Fork the repo and clone your fork.
2. Install [XcodeGen](https://github.com/yonaskolb/XcodeGen): `brew install xcodegen`.
3. Generate the Xcode project: `xcodegen generate`.
4. Open `MDViewer.xcodeproj` and build with the `MDViewer` scheme.

Requirements: macOS 14 (Sonoma) or later, Xcode 15+.

## Project Conventions

- **`project.yml` is the source of truth.** Do not hand-edit `MDViewer.xcodeproj/project.pbxproj` — regenerate via `xcodegen generate`.
- **Swift sources** live under `Sources/MDViewer/`. **Assets** (including `Assets.xcassets`) live under `Sources/Resources/`.
- **Architecture decisions** are recorded in `Documents/Decisions.md` (ADR-style). If your change alters structure or introduces a dependency, add or update an ADR.
- Match existing code style (SwiftUI idioms, value types, small composable views). No SwiftLint config yet — keep diffs minimal and consistent with surrounding code.

## Branching & Commits

- Branches: `feature/<short-name>`, `bugfix/<short-name>`, `docs/<short-name>`.
- Conventional commit style, imperative mood: `Add outline filter`, not `Added outline filter`.
- Atomic commits — the message explains *why*, code shows *what*.
- Signed commits are required on `main`. Configure with `git config commit.gpgsign true` and a signing key.

## Pull Request Process

1. Open an issue first for non-trivial changes so the approach can be agreed before code is written.
2. Run `xcodegen generate` if `project.yml` changed, and commit the regenerated `project.pbxproj`.
3. Build locally and verify the feature works on macOS 14+.
4. Fill in the PR template checklist.
5. CI (`.github/workflows/swift.yml`) must pass.
6. Squash-merge into `main` (the only merge style enabled).

## Reporting Bugs & Requesting Features

Use the issue templates under [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE/). For security issues, follow [`SECURITY.md`](SECURITY.md) instead of opening a public issue.

## Code of Conduct

This project follows the [Contributor Covenant](CODE_OF_CONDUCT.md). By participating you agree to uphold it.

## License

Contributions are licensed under the [MIT License](LICENSE).
