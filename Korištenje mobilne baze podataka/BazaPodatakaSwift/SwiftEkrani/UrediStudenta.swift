import SwiftUI
import SwiftData

struct UrediStudenta: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var studenti: [Student]
    @State private var ime = ""

    var body: some View {
        NavigationStack {
            List {
                TextField("Ime: ", text: $ime)
                RezultatiPretrage(ime: ime)
            }
            .navigationTitle("Pretraživanje studenata")
        }
    }
}

struct RezultatiPretrage: View {
    @Query private var studenti: [Student]
    @Environment(\.modelContext) private var modelContext
    
    init(ime: String) {
        _studenti = Query(filter: #Predicate<Student> { student in
            student.ime == ime })
    }
    var body: some View {
        ForEach(studenti){ student in
            Text("Id: \(student.studentId)")
            Text("Ime: \(student.ime)")
            Text("Prezime: \(student.prezime)")
            Button("Obrisi", role: .destructive){
                modelContext.delete(student)
            }
        }
        
    }
}

#Preview {
    DodajStudenta()
        .modelContainer(for: Student.self, inMemory: true)
}


