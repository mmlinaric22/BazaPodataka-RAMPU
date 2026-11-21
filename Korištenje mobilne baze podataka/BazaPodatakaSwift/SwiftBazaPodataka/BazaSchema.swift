import Foundation
import SwiftData

typealias Student = SchemaV1.Student
typealias Kolegij = SchemaV1.Kolegij
typealias Kolokvij = SchemaV1.Kolokvij

enum SchemaV1: VersionedSchema{
    static var versionIdentifier = Schema.Version(1, 0, 0)
    static var models: [any PersistentModel.Type]{
        [Student.self, Kolegij.self, Kolokvij.self]
    }
}

