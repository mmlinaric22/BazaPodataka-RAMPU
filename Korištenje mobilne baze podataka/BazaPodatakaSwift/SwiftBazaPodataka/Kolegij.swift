import Foundation
import SwiftData


extension SchemaV1{
    @Model
    final class Kolegij {
        @Attribute(.unique) var kolegijId: UUID
        var naziv: String
        var godina: Int
        
        @Relationship(deleteRule: .cascade, inverse: \SchemaV1.Kolokvij.kolegij)
        var kolokviji: [SchemaV1.Kolokvij] = []
        
        init(kolegijId: UUID = UUID(), naziv: String, godina: Int, kolokviji: [SchemaV1.Kolokvij] = []) {
            self.kolegijId = kolegijId
            self.naziv = naziv
            self.godina = godina
            self.kolokviji = kolokviji
        }
    }
}

extension SchemaV2{
    @Model
    final class Kolegij {
        @Attribute(.unique) var kolegijId: UUID
        var naziv: String
        var godina: Int
        
        @Relationship(deleteRule: .cascade, inverse: \SchemaV2.Kolokvij.kolegij)
        var kolokviji: [SchemaV2.Kolokvij] = []
        
        init(kolegijId: UUID = UUID(), naziv: String, godina: Int, kolokviji: [SchemaV2.Kolokvij] = []) {
            self.kolegijId = kolegijId
            self.naziv = naziv
            self.godina = godina
            self.kolokviji = kolokviji
        }
    }
}

