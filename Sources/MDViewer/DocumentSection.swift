import Foundation

struct DocumentSection: Identifiable {
    let id: Int
    let level: Int      // 0 = pre-heading content, 1–3 = heading level
    let title: String
    let content: String
}

extension String {
    func parsedSections() -> [DocumentSection] {
        let lines = components(separatedBy: "\n")
        var result: [DocumentSection] = []
        var buffer: [String] = []
        var currentLevel = 0
        var currentTitle = ""
        var nextID = 0

        func flush() {
            let content = buffer.joined(separator: "\n")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            guard !content.isEmpty else { return }
            result.append(DocumentSection(id: nextID, level: currentLevel,
                                          title: currentTitle, content: content))
            nextID += 1
            buffer = []
        }

        for line in lines {
            if let (level, title) = line.trimmingCharacters(in: .whitespaces).markdownHeading() {
                flush()
                currentLevel = level
                currentTitle = title
            }
            buffer.append(line)
        }
        flush()

        return result.isEmpty
            ? [DocumentSection(id: 0, level: 0, title: "", content: self)]
            : result
    }
}

private extension String {
    func markdownHeading() -> (Int, String)? {
        for (prefix, level) in [("### ", 3), ("## ", 2), ("# ", 1)] where hasPrefix(prefix) {
            return (level, String(dropFirst(prefix.count)))
        }
        return nil
    }
}
