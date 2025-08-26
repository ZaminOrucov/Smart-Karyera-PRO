//
//  Item.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
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
