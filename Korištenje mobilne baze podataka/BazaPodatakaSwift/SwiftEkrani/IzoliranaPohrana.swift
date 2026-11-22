import SwiftUI
import SwiftData

struct IzoliranaPohrana: View {
    @Query private var studenti: [Student]
    @AppStorage("prikaziSamoPolozene") private var prikaziSamoPolozene = false
    @AppStorage("zadnjiIzvoz") private var zadnjiIzvoz = "Ovo je App storage"
    @State private var ucitaniTekst: String = ""
    @State private var statusPoruka: String = ""

    var body: some View {
        Form {
            Section("Izolirana pohrana / App storage") {
                Button("Spremi studente u datoteku") {
                    do {
                        let url = try spremiIzvjestajUIzoliranuPohranu(studenti: studenti)
                        statusPoruka = "Spremljeno u: \(url.lastPathComponent)"
                    } catch {
                        statusPoruka = "Greška pri spremanju: \(error.localizedDescription)"
                    }
                }

                Button("Učitaj studente iz datoteke") {
                    do {
                        ucitaniTekst = try ucitajIzIzoliranePohrane()
                        statusPoruka = "Uspješno učitano iz izolirane pohrane."
                    } catch {
                        statusPoruka = "Datoteka još ne postoji ili greška: \(error.localizedDescription)"
                    }
                }
                
                Toggle("App Storage toggle", isOn: $prikaziSamoPolozene)
                Text("Primjer: \(zadnjiIzvoz)")

                if !statusPoruka.isEmpty {
                    Text(statusPoruka)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            if !ucitaniTekst.isEmpty {
                Section("Sadržaj datoteke") {
                    Text(ucitaniTekst)
                        .font(.body)
                }
            }
        }
        .navigationTitle("Izolirana pohrana")
    }

    private func spremiIzvjestajUIzoliranuPohranu(studenti: [Student]) throws -> URL {
        let fileURL = URL.documentsDirectory.appending(path: "studenti_izolirano.txt")
        let sadrzaj = studenti.map { "\($0.ime) \($0.prezime)" }.joined(separator: "\n")
        try sadrzaj.write(to: fileURL, atomically: true, encoding: .utf8)
        return fileURL
    }

    private func ucitajIzIzoliranePohrane() throws -> String {
        let fileURL = URL.documentsDirectory.appending(path: "studenti_izolirano.txt")
        return try String(contentsOf: fileURL, encoding: .utf8)
    }
}
