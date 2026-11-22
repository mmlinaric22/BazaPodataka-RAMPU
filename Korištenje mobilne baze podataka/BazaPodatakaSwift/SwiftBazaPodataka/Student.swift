import Foundation
import SwiftData


extension SchemaV1{
    @Model
    final class Student {
        @Attribute(.unique) var studentId: UUID
        var ime: String
        var prezime: String
        
        @Relationship(deleteRule: .cascade, inverse: \SchemaV1.Kolokvij.student)
        var kolokviji: [SchemaV1.Kolokvij] = []
        
        init( studentId: UUID = UUID(), ime: String, prezime: String, kolokviji: [SchemaV1.Kolokvij] = []){
            self.studentId = studentId
            self.ime = ime
            self.prezime = prezime
            self.kolokviji = kolokviji
        }
    }
}


extension SchemaV2{
    @Model
    final class Student {
        @Attribute(.unique) var studentId: UUID
        var ime: String
        var prezime: String
        var email: String
        
        @Relationship(deleteRule: .cascade, inverse: \SchemaV2.Kolokvij.student)
        var kolokviji: [SchemaV2.Kolokvij] = []
        
        init( studentId: UUID = UUID(), ime: String, prezime: String, email: String,kolokviji: [SchemaV2.Kolokvij] = []){
            self.studentId = studentId
            self.ime = ime
            self.prezime = prezime
            self.email = email
            self.kolokviji = kolokviji
        }
    }
}
