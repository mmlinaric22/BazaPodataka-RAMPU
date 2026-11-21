import Foundation
import SwiftData


extension SchemaV1{
    @Model
    final class Student {
        @Attribute(.unique) var studentId: UUID
        var ime: String
        var prezime: String
        
        @Relationship(deleteRule: .cascade, inverse: \Kolokvij.student)
        var kolokviji: [Kolokvij] = []
        
        init( studentId: UUID = UUID(), ime: String, prezime: String, kolokviji: [Kolokvij] = []){
            self.studentId = studentId
            self.ime = ime
            self.prezime = prezime
            self.kolokviji = kolokviji
        }
    }
}
