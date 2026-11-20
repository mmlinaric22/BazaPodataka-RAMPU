import SwiftUI
import SwiftData

@main
struct BazaPodatakaSwiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
