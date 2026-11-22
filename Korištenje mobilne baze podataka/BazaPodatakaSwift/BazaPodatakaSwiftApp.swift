import SwiftUI
import SwiftData

@main
struct BazaPodatakaSwiftApp: App {
    let container: ModelContainer

    init() {
        do {
            let schema = Schema(versionedSchema: SchemaV2.self)
            container = try ModelContainer(
                for: schema,
                migrationPlan: MigracijaSchema.self
            )
            } catch {
                fatalError("Neuspjela migracija baze podataka: \(error)")
            }
        }
    var body: some Scene {
        WindowGroup {
            DodajStudenta()
        }
        .modelContainer(for: Student.self)
    }
}
