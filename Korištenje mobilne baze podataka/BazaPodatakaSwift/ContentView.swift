import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var studenti: [Student]
    @State private var ime = ""

    var body: some View {
        NavigationStack {
            List {
                TextField("Ime: ", text: $ime)
                Button("Dodaj"){
                    guard !ime.isEmpty else {return}
                    modelContext.insert(Student(ime: ime))
                }
                ForEach(studenti){ student in
                    Text("Ime: \(student.ime)")
                }
            }
            .navigationTitle("Lista")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Student.self, inMemory: true)
}
