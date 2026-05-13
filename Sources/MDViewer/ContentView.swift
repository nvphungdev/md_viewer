import SwiftUI
import MarkdownUI

struct ContentView: View {
    let document: MarkdownDocument
    @AppStorage("fontSize") private var fontSize: Double = 14
    @AppStorage("theme") private var themeRaw: String = Theme.gitHub.rawValue
    @State private var searchText: String = ""

    var body: some View {
        ScrollView {
            Markdown(filtered)
                .markdownTheme(currentTheme.markdownTheme)
                .markdownTextStyle { FontSize(fontSize) }
                .textSelection(.enabled)
                .padding(24)
                .frame(maxWidth: 900, alignment: .leading)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Stepper("Font", value: $fontSize, in: 10...28, step: 1)
                    .labelsHidden()
            }
            ToolbarItem(placement: .primaryAction) {
                Picker("Theme", selection: $themeRaw) {
                    ForEach(Theme.allCases) { t in
                        Text(t.label).tag(t.rawValue)
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .searchable(text: $searchText, placement: .toolbar, prompt: "Filter")
    }

    private var filtered: String {
        guard !searchText.isEmpty else { return document.text }
        return document.text
            .split(separator: "\n", omittingEmptySubsequences: false)
            .filter { $0.localizedCaseInsensitiveContains(searchText) }
            .joined(separator: "\n")
    }

    private var currentTheme: Theme {
        Theme(rawValue: themeRaw) ?? .gitHub
    }
}

enum Theme: String, CaseIterable, Identifiable {
    case gitHub, docC, basic
    var id: String { rawValue }
    var label: String {
        switch self {
        case .gitHub: return "GitHub"
        case .docC:   return "DocC"
        case .basic:  return "Basic"
        }
    }
    var markdownTheme: MarkdownUI.Theme {
        switch self {
        case .gitHub: return .gitHub
        case .docC:   return .docC
        case .basic:  return .basic
        }
    }
}
