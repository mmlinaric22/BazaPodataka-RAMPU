import SwiftUI
import SwiftData

@main
struct BazaPodatakaSwiftApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                NavigationLink("Dodaj studenta Swift") {
                    DodajStudenta()
                }.buttonStyle(.borderedProminent)
                
                NavigationLink("Pretraži studenta Swift") {
                    UrediStudenta()
                }.buttonStyle(.bordered)
            }
        }
        .modelContainer(for: Student.self)
    }
}
