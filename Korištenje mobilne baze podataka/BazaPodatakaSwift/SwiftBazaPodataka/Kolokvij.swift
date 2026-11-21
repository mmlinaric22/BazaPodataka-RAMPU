import Foundation
import SwiftData

extension SchemaV1{
    @Model
    final class Kolokvij {
        @Attribute(.unique) var kolokvijId: UUID
        var redniBroj: Int
        var datumPisanja: Date
        var ocjena: Int
        var kolegij: Kolegij?
        var student: Student?
        
        init(kolokvijId: UUID = UUID(), redniBroj: Int, datumPisanja: Date, ocjena: Int,kolegij: Kolegij? = nil, student: Student? = nil) {
            self.kolokvijId = kolokvijId
            self.redniBroj = redniBroj
            self.datumPisanja = datumPisanja
            self.ocjena = ocjena
            self.kolegij = kolegij
            self.student = student
        }
    }
}
