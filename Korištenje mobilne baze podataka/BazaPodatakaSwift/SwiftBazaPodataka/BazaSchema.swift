import Foundation
import SwiftData

typealias Student = SchemaV2.Student
typealias Kolegij = SchemaV2.Kolegij
typealias Kolokvij = SchemaV2.Kolokvij

enum SchemaV1: VersionedSchema{
    static var versionIdentifier = Schema.Version(1, 0, 0)
    static var models: [any PersistentModel.Type]{
        [Student.self, Kolegij.self, Kolokvij.self]
    }
}

enum SchemaV2: VersionedSchema{
    static var versionIdentifier = Schema.Version(2, 0, 0)
    static var models: [any PersistentModel.Type]{
        [Student.self, Kolegij.self, Kolokvij.self]
    }
}

