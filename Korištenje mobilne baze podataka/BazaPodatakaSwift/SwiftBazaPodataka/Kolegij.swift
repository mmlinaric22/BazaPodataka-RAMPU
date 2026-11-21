import Foundation
import SwiftData


extension SchemaV1{
    @Model
    final class Kolegij {
        @Attribute(.unique) var kolegijId: UUID
        var naziv: String
        var godina: Int
        
        @Relationship(deleteRule: .cascade, inverse: \Kolokvij.kolegij)
        var kolokviji: [Kolokvij] = []
        
        init(kolegijId: UUID = UUID(), naziv: String, godina: Int, kolokviji: [Kolokvij] = []) {
            self.kolegijId = kolegijId
            self.naziv = naziv
            self.godina = godina
            self.kolokviji = kolokviji
        }
    }
}
