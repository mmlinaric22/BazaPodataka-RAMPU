import SwiftUI
import SwiftData

@main
struct BazaPodatakaSwiftApp: App {
    let container: ModelContainer

    init() {
        do {
            let schema = Schema(versionedSchema: SchemaV2.self)
            
            let appSupportURL = URL.applicationSupportDirectory
            try FileManager.default.createDirectory(at: appSupportURL, withIntermediateDirectories: true)
            let isolatedStoreURL = appSupportURL.appending(path: "IzoliranaBaza_V2.store")
            
            let config = ModelConfiguration(
                "Izolirana pohrana",
                schema: schema,
                url: isolatedStoreURL
            )
            
            container = try ModelContainer(
                for: schema,
                migrationPlan: MigracijaSchema.self,
                configurations: config
            )
            } catch {
                fatalError("Neuspjela migracija baze podataka: \(error)")
            }
        }
    
    var body: some Scene {
        WindowGroup {
            DodajStudenta()
        }
        .modelContainer(container)
    }
}
