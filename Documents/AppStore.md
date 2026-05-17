# App Store Connect — MDViewer Submission Fields

Source-of-truth doc for every field that must be populated in [App Store Connect](https://appstoreconnect.apple.com) when submitting MDViewer to the Mac App Store. Pre-filled with current values where known; `TODO` markers indicate decisions still required.

Bundle ID: `com.ploutonconsulting.mdviewer`
Apple Team ID: `7X2XV24BPN` (Plouton Consulting (Pty) Ltd)
Current version / build: `0.1.1 (2)`

---

## 1. App Information (set once, applies to all versions)

| Field | Value | Notes |
|---|---|---|
| Name | `MD Viewer` | 30-char max. Shown on App Store + Launchpad. |
| Subtitle | `Fast native Markdown reader` | 30-char max. Appears under name on store. |
| Primary Language | English (U.S.) | |
| Bundle ID | `com.ploutonconsulting.mdviewer` | Must match Xcode + provisioning. |
| SKU | `MDVIEWER-MAC-001` | Internal, never shown publicly. Unique per app. |
| User Access | Full Access | No restricted-user tiers. |
| Primary Category | Developer Tools | Matches `LSApplicationCategoryType` in Info.plist. |
| Secondary Category | Productivity | Optional but recommended. |
| Content Rights | No, it does not contain, show, or access third-party content | We render user-supplied `.md` files; no embedded third-party content shipped. |
| Age Rating | 4+ | No mature content. Questionnaire below. |

### Age Rating Questionnaire (answer all "None")

- Cartoon or Fantasy Violence: None
- Realistic Violence: None
- Sexual Content or Nudity: None
- Profanity or Crude Humor: None
- Alcohol, Tobacco, or Drug Use: None
- Mature/Suggestive Themes: None
- Horror/Fear Themes: None
- Gambling: None
- Contests: None
- Unrestricted Web Access: **No** (sandbox blocks network; no in-app browser)
- Medical/Treatment Information: None

---

## 2. Pricing and Availability

| Field | Value |
|---|---|
| Price Tier | Free (USD 0.00) |
| Availability | All territories |
| Pre-Orders | Off |
| Volume Purchase Program | Available, with no discount |
| Mac Distribution | Available on the Mac App Store |

---

## 3. App Privacy

Data collection profile: **No data collected.**

| Section | Answer |
|---|---|
| Do you or your third-party partners collect data from this app? | **No** |
| Tracking (App Tracking Transparency) | Not applicable — no tracking |
| Privacy Policy URL | `https://github.com/ploutonconsulting/md_viewer/blob/main/PRIVACY.md` (live) |

If the app ever adds analytics / crash reporting / iCloud sync, this section must be updated **before** the build is submitted.

---

## 4. Version Information (per-version page, currently 0.1.1)

| Field | Value | Notes |
|---|---|---|
| Promotional Text | `Fast, native Markdown reader for macOS. Themes, outline navigation, live filter. Sandboxed, offline, no telemetry.` (105 chars) | 170-char max. Editable without resubmission. Alternates in **§4.3**. |
| Description | See **§4.1** below. | 4000-char max. |
| Keywords | `markdown,md,viewer,reader,outline,gfm,notes,docs,readme,preview,text,sandboxed,offline,native` (99 chars) | 100-char max total, comma-separated, no spaces. Alternates in **§4.4**. |
| Support URL | `https://github.com/ploutonconsulting/md_viewer/issues` | Required. |
| Marketing URL | `https://github.com/ploutonconsulting/md_viewer` | Optional. |
| Copyright | `© 2026 Plouton Consulting (Pty) Ltd.` | Matches `NSHumanReadableCopyright`. |
| Version | `0.1.1` | Matches `CFBundleShortVersionString`. |
| Routing App Coverage File | n/a | |
| Sign-In Required | No | |
| Contact Information | `oosthuizen.pierre@gmail.com` | |

### 4.1 Description

```
MD Viewer is a fast, native macOS reader for Markdown files.

Built with SwiftUI and the MarkdownUI rendering engine, it opens .md, .markdown, .mdown, .mkd, .mkdn, and .mdtxt documents with native document-based behaviour — open, recents, multi-window, and full sandboxing.

Features
• GitHub Flavored Markdown rendering
• Document outline sidebar for fast heading navigation
• Multiple themes plus automatic system dark mode
• Adjustable font size
• In-document text filter
• Sandboxed and entirely offline — no network, no telemetry
• Universal binary for Apple Silicon and Intel

MD Viewer is open source under the MIT licence. Source, issues, and roadmap live at github.com/ploutonconsulting/md_viewer.
```

### 4.3 Promotional Text — alternates

170-char max. Editable any time without resubmission, so good place for time-limited messages (sales, "new in 0.1.2", etc).

- **Selected (105):** `Fast, native Markdown reader for macOS. Themes, outline navigation, live filter. Sandboxed, offline, no telemetry.`
- A (124): `Open, browse, and search Markdown files with a fast, native macOS interface — themes, outline navigation, and live filter.`
- C (139): `Native macOS Markdown reader built in SwiftUI. Outline sidebar, GFM rendering, themes, dark mode, and instant filter. Sandboxed and offline.`

### 4.4 Keywords — alternates

100-char max total. Comma-separated. **No spaces. No app-name/subtitle repeats. No trademarks** (Apple often rejects competitor names like `obsidian`, `bear`, `gitbook`).

- **Selected (99):** `markdown,md,viewer,reader,outline,gfm,notes,docs,readme,preview,text,sandboxed,offline,native`
- A (68, narrow): `markdown,md,viewer,reader,notes,documentation,obsidian,bear,gfm,docs` — uses competitor names, risk of reject
- B (90, broad): `markdown,md,viewer,reader,notes,docs,readme,gfm,outline,preview,writer,text,editor,gitbook`

ASO notes:
- Apple stems automatically — skip plurals.
- `markdown` and `md` both worth keeping — different user input habits.
- Avoid repeating words already in **Name** (`md viewer`) or **Subtitle** (`markdown reader`) — wastes character budget.
- Iterate post-launch using App Store Connect → Analytics → Search Terms.

### 4.5 What's New in This Version

```
0.1.1
• First Mac App Store release.
• Developer ID signed, notarized, and stapled.
• Adjustable font size and document outline sidebar.
• System dark mode and multiple built-in themes.
```

---

## 5. App Review Information

| Field | Value |
|---|---|
| Sign-In Required | No |
| Demo Account | n/a (no auth) |
| Contact First Name | Pierre |
| Contact Last Name | Oosthuizen |
| Contact Phone | TODO |
| Contact Email | `oosthuizen.pierre@gmail.com` |
| Notes | See **§5.1** |
| Attachment | Optional sample `.md` file demonstrating outline + code blocks |

### 5.1 Notes for Reviewer

```
MD Viewer is a read-only Markdown document viewer. There is no account, no network access, and no in-app purchases.

To test:
1. Launch the app.
2. File → Open → choose any .md file (a sample is attached).
3. The document renders with an outline sidebar, theme picker, and font-size controls.
4. Cmd-F filters text within the document.

The app is sandboxed (user-selected read-only file access). It performs no network requests and stores no data outside the user-chosen document.

Source code: https://github.com/ploutonconsulting/md_viewer
```

---

## 6. Assets

### 6.1 App Icon (App Store)

| Asset | Spec | Source |
|---|---|---|
| Marketing icon | 1024×1024 PNG, sRGB, no alpha, no transparency, square corners | `Sources/Resources/Assets.xcassets/AppIcon.appiconset/icon_1024.png` |

App Store strips rounded corners — submit a square master.

### 6.2 Screenshots (required for Mac)

Apple accepts one of three sizes — pick **one** and provide 1–10 screenshots:

| Display | Pixel size |
|---|---|
| 16:10 (preferred) | `2560×1600` or `2880×1800` |
| 16:9 | `1280×800`, `1440×900`, `2560×1440`, `2880×1620` |

Capture on a Retina Mac with the actual app running. Recommended set (5 screenshots):

1. Document open with outline sidebar visible (light theme)
2. Same document, dark theme
3. Filter active with match highlighting
4. Theme picker open
5. Multi-window with two docs

Store under `Marketing/Screenshots/<size>/` (gitignored if large).

### 6.3 App Previews (optional)

15–30 second screen recordings, same aspect/resolution constraints as screenshots. Skip for v0.1.1 — add post-launch.

---

## 7. Build Upload

Path:

```
Xcode → Product → Archive → Organizer →
  Distribute App → App Store Connect → Upload →
  Automatically manage signing → Distribute
```

Pre-flight checks before archiving:

- [ ] `MARKETING_VERSION` and `CURRENT_PROJECT_VERSION` in `project.yml` match release intent (currently `0.1.1` / `2`).
- [ ] `xcodegen generate` run, `project.pbxproj` regenerated.
- [ ] `DEVELOPMENT_TEAM = 7X2XV24BPN` present in `project.yml` settings.
- [ ] `ENABLE_HARDENED_RUNTIME = YES`.
- [ ] `com.apple.security.app-sandbox = true` in entitlements.
- [ ] Entitlements include `com.apple.security.files.user-selected.read-only` and `files.bookmarks.app-scope`.
- [ ] Bundle version not previously uploaded (increment if so — App Store Connect rejects duplicates).

After upload:

- Wait for "Processing" → "Ready to Submit" email (5–30 min).
- Select the new build on the version page.
- Submit for Review.

---

## 8. Privacy Manifest (PrivacyInfo.xcprivacy)

Required for App Store apps as of Spring 2024. TODO: add `Sources/Resources/PrivacyInfo.xcprivacy` declaring:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>NSPrivacyTracking</key><false/>
  <key>NSPrivacyTrackingDomains</key><array/>
  <key>NSPrivacyCollectedDataTypes</key><array/>
  <key>NSPrivacyAccessedAPITypes</key>
  <array>
    <dict>
      <key>NSPrivacyAccessedAPIType</key>
      <string>NSPrivacyAccessedAPICategoryFileTimestamp</string>
      <key>NSPrivacyAccessedAPITypeReasons</key>
      <array><string>C617.1</string></array>
    </dict>
    <dict>
      <key>NSPrivacyAccessedAPIType</key>
      <string>NSPrivacyAccessedAPICategoryUserDefaults</string>
      <key>NSPrivacyAccessedAPITypeReasons</key>
      <array><string>CA92.1</string></array>
    </dict>
  </array>
</dict>
</plist>
```

Verify the API category list against the [Apple required-reason API list](https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/describing_use_of_required_reason_api) before submission — add entries if MDViewer ever uses `system boot time`, `disk space`, or `active keyboard`.

---

## 9. Third-Party SDK Disclosures

MarkdownUI is the only third-party dependency (SwiftPM, `gonzalezreal/swift-markdown-ui`). Apple does not require an SDK disclosure for non-commercial open-source dependencies, but confirm the dep does not collect data (it does not).

---

## 10. Pre-Submission Checklist

- [ ] App Store Connect record created (`+` → New App → macOS)
- [ ] All §1 fields filled
- [ ] §3 privacy questionnaire complete
- [ ] §4 version page filled (description, keywords, URLs, copyright)
- [ ] §4.2 What's New written
- [ ] §5 review notes + contact filled
- [ ] §6.1 marketing 1024 icon uploaded
- [ ] §6.2 screenshots uploaded (≥1 size, 1–10 images)
- [ ] §8 PrivacyInfo.xcprivacy bundled and added to project.yml resources
- [ ] Build uploaded via Xcode Organizer and processed
- [ ] Build attached to version
- [ ] Export Compliance: "Does your app use encryption?" → **No** (we use no custom crypto; system TLS is exempt anyway — but answering No is safe since we make no network calls)
- [ ] "Submit for Review" pressed

---

## Outstanding Decisions / TODOs

1. ~~Create `PRIVACY.md` in repo root~~ — done, linked from §3.
2. Decide phone contact for §5 review information.
3. Capture five screenshots at one accepted resolution → §6.2.
4. Author `Sources/Resources/PrivacyInfo.xcprivacy` and add to bundle resources via `project.yml` → §8.
5. Confirm subtitle wording (`Fast native Markdown reader`) — alternates: `Native Markdown reader for macOS`, `Markdown reader. Fast. Native.`
6. Confirm keyword set against ASO competitor scan before first submission.
