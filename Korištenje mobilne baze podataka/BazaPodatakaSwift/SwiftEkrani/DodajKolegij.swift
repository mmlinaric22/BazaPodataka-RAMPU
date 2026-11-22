import SwiftUI
import SwiftData

struct DodajKolegij: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var kolegiji: [Kolegij]
    @State private var naziv = ""
    @State private var godina = ""

    var body: some View {
        NavigationStack {
            List {
                TextField("Naziv: ", text: $naziv)
                TextField("Godina: ", text: $godina)
                Button("Dodaj"){
                    guard !naziv.isEmpty, let godinaInt = Int(godina) else {return}
                    modelContext.insert(Kolegij(naziv: naziv, godina: godinaInt))
                }
                NavigationLink("Pretraži studenta Swift") {
                    DodajStudenta()
                }.buttonStyle(.bordered)
                NavigationLink("Dodaj kolokvij") {
                    DodajKolokvij()
                }.buttonStyle(.bordered)
                ForEach(kolegiji){ kolegij in
                    Text("Id: \(kolegij.kolegijId)")
                    Text("Naziv: \(kolegij.naziv)")
                    Text("Godina: \(kolegij.godina)")
                }
            }
            .navigationTitle("Dodaj Kolegij")
        }
    }
}
