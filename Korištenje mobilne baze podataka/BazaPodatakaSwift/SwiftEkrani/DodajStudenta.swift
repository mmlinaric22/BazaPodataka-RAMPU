import SwiftUI
import SwiftData

struct DodajStudenta: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var studenti: [Student]
    @State private var ime = ""
    @State private var prezime = ""
    @State private var email = ""

    var body: some View {
        NavigationStack {
            List {
                TextField("Ime: ", text: $ime)
                TextField("Prezime: ", text: $prezime)
                TextField("Email: ", text: $email)
                Button("Dodaj"){
                    guard !ime.isEmpty, !prezime.isEmpty, !email.isEmpty else {return}
                    modelContext.insert(Student(ime: ime, prezime: prezime, email: email))
                }
                NavigationLink("Pretraži studenta Swift") {
                    UrediStudenta()
                }.buttonStyle(.bordered)
                NavigationLink("Dodaj kolegij") {
                    DodajKolegij()
                }.buttonStyle(.bordered)
                ForEach(studenti){ student in
                    Text("Id: \(student.studentId)")
                    Text("Ime: \(student.ime)")
                    Text("Prezime: \(student.prezime)")
                    Text("Email: \(student.email)")
                }
            }
            .navigationTitle("Dodaj Studenta")
        }
    }
}

#Preview {
    DodajStudenta()
        .modelContainer(for: Student.self, inMemory: true)
}
