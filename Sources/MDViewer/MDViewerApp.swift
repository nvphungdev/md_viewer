import SwiftUI

@main
struct MDViewerApp: App {
    var body: some Scene {
        DocumentGroup(viewing: MarkdownDocument.self) { config in
            ContentView(document: config.document, fileURL: config.fileURL)
                .navigationTitle(config.fileURL?.lastPathComponent ?? "Untitled")
        }
        .commands {
            CommandGroup(replacing: .newItem) {}
            SidebarCommands()
            ToolbarCommands()
        }
    }
}
