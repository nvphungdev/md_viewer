import SwiftUI

struct OutlineSidebarView: View {
    let sections: [DocumentSection]
    @Binding var selectedSectionID: Int?

    private var headings: [DocumentSection] {
        sections.filter { $0.level > 0 }
    }

    var body: some View {
        Group {
            if headings.isEmpty {
                ContentUnavailableView(
                    "No Outline",
                    systemImage: "list.bullet",
                    description: Text("This document has no headings.")
                )
            } else {
                List(selection: $selectedSectionID) {
                    ForEach(headings) { section in
                        Text(section.title)
                            .font(font(for: section.level))
                            .foregroundStyle(section.level == 1 ? .primary : .secondary)
                            .lineLimit(2)
                            .padding(.leading, CGFloat((section.level - 1) * 12))
                            .tag(section.id)
                    }
                }
                .listStyle(.sidebar)
            }
        }
        .navigationTitle("Outline")
        .navigationSplitViewColumnWidth(min: 160, ideal: 200, max: 280)
    }

    private func font(for level: Int) -> Font {
        switch level {
        case 1: return .body.weight(.semibold)
        case 2: return .body
        default: return .callout
        }
    }
}
