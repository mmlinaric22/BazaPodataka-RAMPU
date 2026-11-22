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
            NavigationLink("Dodaj studenta Swift") {
                DodajStudenta()
            }.buttonStyle(.bordered)
            .navigationTitle("Pretraživanje studenata")
        }
    }
}

struct RezultatiPretrage: View {
    @Query private var studenti: [Student]
    @Query private var kolokviji: [Kolokvij]
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
            Text("Email: \(student.email)")
            ForEach(student.kolokviji, id: \.kolokvijId) { kolokvij in
                    Text("\(kolokvij.kolegij?.naziv ?? "Nepoznat kolegij") (\(kolokvij.redniBroj). kolokvij): Ocjena \(kolokvij.ocjena)")
                    .font(.subheadline)
            }
            NavigationLink("Uredi") {
                DetaljiStudenta(student: student)
            }.buttonStyle(.bordered)
            Button("Obrisi", role: .destructive){
                modelContext.delete(student)
            }
        }
        .navigationTitle("Pregled studenta")
    }
}

struct DetaljiStudenta: View {
    @Bindable var student: Student
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        Form{
            TextField("Ime studenta: ", text: $student.ime)
            TextField("Prezime studenta: ", text: $student.prezime)
            TextField("Prezime studenta: ", text: $student.email)
            Button("Spremi"){
                dismiss()
            }
        }
    }
}


