import Foundation
import SwiftData

@Model
final class Student {
    var ime: String
    
    init(ime: String){
        self.ime = ime
    }
}
