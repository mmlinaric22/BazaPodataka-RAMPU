import Foundation
import SwiftData

extension SchemaV1{
    @Model
    final class Kolokvij {
        @Attribute(.unique) var kolokvijId: UUID
        var redniBroj: Int
        var ocjena: Int
        var kolegij: SchemaV1.Kolegij? = nil
        var student: SchemaV1.Student? = nil
        
        init(kolokvijId: UUID = UUID(), redniBroj: Int, ocjena: Int,kolegij: SchemaV1.Kolegij?, student: SchemaV1.Student?) {
            self.kolokvijId = kolokvijId
            self.redniBroj = redniBroj
            self.ocjena = ocjena
            self.kolegij = kolegij
            self.student = student
        }
    }
}

extension SchemaV2{
    @Model
    final class Kolokvij {
        @Attribute(.unique) var kolokvijId: UUID
        var redniBroj: Int
        var ocjena: Int
        var kolegij: SchemaV2.Kolegij? = nil
        var student: SchemaV2.Student? = nil
        
        init(kolokvijId: UUID = UUID(), redniBroj: Int, ocjena: Int,kolegij: SchemaV2.Kolegij?, student: SchemaV2.Student?) {
            self.kolokvijId = kolokvijId
            self.redniBroj = redniBroj
            self.ocjena = ocjena
            self.kolegij = kolegij
            self.student = student
        }
    }
}
