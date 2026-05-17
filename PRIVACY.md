# MD Viewer — Privacy Policy

_Last updated: 2026-05-17_

MD Viewer ("the app") is a native macOS application that opens and renders Markdown documents on your Mac. This document describes — exhaustively — what data the app does and does not handle.

## TL;DR

MD Viewer collects nothing, transmits nothing, and stores nothing outside the document you choose to open and your local preferences. There are no accounts, no analytics, no crash reporting, no advertising, no tracking, and no third-party SDKs that collect data.

## Data the app collects

**None.** The app does not collect, process, or transmit any personal data.

## Data the app accesses on your Mac

Strictly limited by the macOS App Sandbox:

| What | Why | Where it goes |
|---|---|---|
| Markdown files you open via File → Open or drag-and-drop | To render and display them | Stays on your Mac. Read-only access — the app cannot modify your files. |
| Security-scoped bookmarks for recently opened files | To restore "Open Recent" entries across launches | Stored in your local app sandbox container. Never transmitted. |
| User preferences (theme, font size, window state) | To remember your settings between launches | Stored in `~/Library/Containers/com.ploutonconsulting.mdviewer/Data/Library/Preferences/`. Never transmitted. |

## Network

The app **makes no network requests** of any kind. It does not check for updates, send telemetry, fetch remote content, or contact any server. You can verify this by running the app with Little Snitch, LuLu, or any outbound firewall — there is no outbound traffic to allow or deny.

## Sandbox entitlements

For full transparency, the app declares the following entitlements (see `Sources/MDViewer/MDViewer.entitlements` in the public source repository):

- `com.apple.security.app-sandbox` — runs inside the macOS App Sandbox.
- `com.apple.security.files.user-selected.read-only` — read-only access to files you explicitly open.
- `com.apple.security.files.bookmarks.app-scope` — persists "Open Recent" bookmarks for files you have opened.

No network entitlement is requested. No microphone, camera, contacts, calendar, photos, or location entitlement is requested.

## Third-party code

The app links one third-party Swift package:

- [MarkdownUI](https://github.com/gonzalezreal/swift-markdown-ui) — rendering engine. Open source, MIT licensed, no data collection.

No advertising SDKs, no analytics SDKs, no crash-reporting SDKs.

## Children

The app is suitable for all ages and collects no data from anyone, including children under 13.

## Changes to this policy

If the app ever changes in a way that adds data collection (for example, optional crash reporting or iCloud sync), this document will be updated in the same commit that introduces the change, and the App Store version notes will call it out. The change history is fully auditable in the public Git history.

## Contact

Privacy questions, concerns, or reports of suspected data collection:

- Email: oosthuizen.pierre@gmail.com
- Issues: <https://github.com/ploutonconsulting/md_viewer/issues>
- Security disclosures: see [SECURITY.md](SECURITY.md)

## Verification

The source code is public at <https://github.com/ploutonconsulting/md_viewer>. You can verify every claim in this document by reading the source, inspecting `Sources/MDViewer/MDViewer.entitlements`, or running the released `.app` under an outbound firewall.
