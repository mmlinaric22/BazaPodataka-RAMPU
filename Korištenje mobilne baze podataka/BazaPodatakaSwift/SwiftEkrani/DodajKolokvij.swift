import SwiftUI
import SwiftData

struct DodajKolokvij: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var kolokviji: [Kolokvij]
    @Query private var studenti: [Student]
    @Query private var kolegiji: [Kolegij]
    @State private var redniBroj = ""
    @State private var ocjena = ""
    @State private var odabraniStudent: Student?
    @State private var odabraniKolegij: Kolegij?

    var body: some View {
        NavigationStack {
            List {
                TextField("Redni broj: ", text: $redniBroj)
                TextField("Ocjena: ", text: $ocjena)
                Picker("Student", selection: $odabraniStudent) {
                    Text("Odaberi studenta").tag(nil as Student?)
                    ForEach(studenti) { student in
                        Text("\(student.ime) \(student.prezime)").tag(student as Student?)
                    }
                }

                Picker("Kolegij", selection: $odabraniKolegij) {
                    Text("Odaberi kolegij").tag(nil as Kolegij?)
                        ForEach(kolegiji) { kolegij in
                                    Text(kolegij.naziv).tag(kolegij as Kolegij?)
                                }
                            }
                Button("Dodaj"){
                    guard let redniBrojInt = Int(redniBroj), let ocjenaInt = Int(ocjena), let odabraniKolegij, let odabraniStudent else {return}
                    let noviKolokvij = Kolokvij(
                        redniBroj: redniBrojInt,
                        ocjena: ocjenaInt,
                        kolegij: odabraniKolegij,
                        student: odabraniStudent
                    )
                    modelContext.insert(noviKolokvij)
                }
                NavigationLink("Pretraži studenta Swift") {
                    UrediStudenta()
                }.buttonStyle(.bordered)
                ForEach(kolokviji){ kolokvij in
                    Text("Id: \(kolokvij.kolokvijId)")
                    Text("Redni broj: \(kolokvij.redniBroj).")
                    Text("Godina: \(kolokvij.ocjena)")
                    Text("Student: \(kolokvij.student?.ime ?? "Unknown") \(kolokvij.student?.prezime ?? "Unknown")")
                    Text("Kolegij: \(kolokvij.kolegij?.naziv ?? "Unknown")")
                }
            }
            .navigationTitle("Dodaj Kolokvij")
        }
    }
}

