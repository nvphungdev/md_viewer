import MarkdownUI

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
