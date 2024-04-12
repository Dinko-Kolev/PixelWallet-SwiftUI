//
//  Category.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//

import Foundation
import SwiftData

@Model
class Category {
    @Attribute(.unique) var id: String
    var name: String
    var symbol: String
    
    
    init(id: String = UUID().uuidString , name: String = "", symbol: String = "") {
        self.id = id
        self.name = name
        self.symbol = symbol
    }
}

extension Category {
    
    static var defaults: [Category] = [
        Category(name: "Rent / Mortgage", symbol: "house.fill"),
        Category(name: "Electric", symbol: "bolt.fill"),
        Category(name: "Water", symbol: "drop.fill"),
        Category(name: "Internet", symbol: "globe"),
        Category(name: "Groceries", symbol: "cart.fill"),
        Category(name: "Transportation", symbol: "car.fill"),
        Category(name: "Interest & Fees", symbol: "dollarsign.circle.fill"),
        Category(name: "Auto Maintenance", symbol: "wrench.fill"),
        Category(name: "Home Maintenance", symbol: "hammer.fill"),
        Category(name: "Renter’s Home Insurance", symbol: "house.fill"),
        Category(name: "Medical", symbol: "staroflife.fill"),
        Category(name: "Clothing", symbol: "tshirt.fill"),
        Category(name: "Gifts", symbol: "gift.fill"),
        Category(name: "Giving", symbol: "handshake.fill"),
        Category(name: "Computer Replacement", symbol: "laptopcomputer"),
        Category(name: "Software Subscriptions", symbol: "appletv"),
        Category(name: "Stuff I Forgot to Budget For", symbol: "questionmark.circle.fill"),
        Category(name: "Student Loan", symbol: "graduationcap.fill"),
        Category(name: "Auto Loan", symbol: "car.fill"),
        Category(name: "Vacation", symbol: "airplane"),
        Category(name: "Fitness", symbol: "figure.walk.circle.fill"),
        Category(name: "Education", symbol: "book.fill"),
        Category(name: "Dining Out", symbol: "tray.fill")
    ]
}

extension Category{
    
    static var symbols: [String] = [
        "car.fill",
        "tram.fill",
        "bus.fill",
        "airplane.fill",
        "bicycle.circle.fill",
        "train.circle.fill",
        "house.fill",
        "house.circle.fill",
        "building.columns.fill",
        "building.2.fill",
        "building.fill",
        "building.3.fill",
        "suitcase.fill",
        "beach",
        "palm.tree.fill",
        "tent.fill",
        "mountain.fill",
        "compass.circle.fill",
        "heart.fill",
        "bolt.fill",
        "drop.fill",
        "figure.walk.circle.fill",
        "figure.stand.circle.fill",
        "fork.knife.circle.fill",
        "chef.hat.fill",
        "leaf.fill",
        "tray.fill",
        "spoon.fill",
        "fork.fill",
        "book.fill",
        "graduationcap.fill",
        "pencil.tip.fill",
        "square.grid.3x2.fill",
        "paperplane.fill",
        "paperclip",
        "gamecontroller.fill",
        "film.fill",
        "music.note.fill",
        "ticket.fill",
        "camera.fill",
        "headphones.circle.fill",
        "bag.fill",
        "creditcard.fill",
        "cart.fill",
        "gift.fill",
        "tag.fill",
        "creditcard.circle.fill",
        "bolt.fill",
        "drop.fill",
        "lightbulb.fill",
        "leaf.fill",
        "waveform.path.ecg.rectangle.fill",
        "gearshape.fill"
    ]

    
    
    
}

