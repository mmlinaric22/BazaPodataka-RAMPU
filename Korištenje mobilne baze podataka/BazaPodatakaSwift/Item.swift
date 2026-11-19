//
//  Item.swift
//  BazaPodatakaSwift
//
//  Created by RAMPU on 19.11.2026..
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
