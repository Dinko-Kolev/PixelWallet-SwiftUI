//
//  Item.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
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
