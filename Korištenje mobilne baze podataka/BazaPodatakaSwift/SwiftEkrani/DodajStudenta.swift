import SwiftUI
import SwiftData

struct DodajStudenta: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var studenti: [Student]
    @State private var ime = ""
    @State private var prezime = ""

    var body: some View {
        NavigationStack {
            List {
                TextField("Ime: ", text: $ime)
                TextField("Prezime: ", text: $prezime)
                Button("Dodaj"){
                    guard !ime.isEmpty, !prezime.isEmpty else {return}
                    modelContext.insert(Student(ime: ime, prezime: prezime))
                }
                ForEach(studenti){ student in
                    Text("Id: \(student.studentId)")
                    Text("Ime: \(student.ime)")
                    Text("Prezime: \(student.prezime)")
                }
            }
            .navigationTitle("Lista Studenata")
        }
    }
}

#Preview {
    DodajStudenta()
        .modelContainer(for: Student.self, inMemory: true)
}
