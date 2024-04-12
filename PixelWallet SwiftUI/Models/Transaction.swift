//
//  Transaction.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 3/4/24.
//

import Foundation
import SwiftData

@Model
class Transaction {
    @Attribute(.unique) var id = UUID().uuidString
    var title: String = ""
    var amount: Double = 0.00
    var date: Date = Date()
    var isIncome: Bool = false
    @Relationship  var category: Category?
    
    init(id: String = UUID().uuidString, title: String , amount: Double, date: Date, isIncome: Bool, category: Category) {
        self.id = id
        self.title = title
        self.amount = amount
        self.date = date
        self.isIncome = isIncome
        self.category = category
    }
    
    enum typeOfTransaction: String, CaseIterable, Identifiable{
        case income = "Income"
        case expense = "Expense"
        var id: Self {self}
    }
    
    // Define default transactions
    static var defaults: [Transaction] {
        return [
            Transaction(title: "Salary", amount: 3000.00, date: Date(), isIncome: true, category: Category.defaults[0]), // Example income transaction
            Transaction(title: "Rent", amount: 1200.00, date: Date(), isIncome: false, category: Category.defaults[1]), // Example expense transaction
            Transaction(title: "Groceries", amount: 200.00, date: Date(), isIncome: false, category: Category.defaults[4]), // Example expense transaction
            Transaction(title: "Internet Bill", amount: 60.00, date: Date(), isIncome: false, category: Category.defaults[3]), // Example expense transaction
            Transaction(title: "Fitness Membership", amount: 50.00, date: Date(), isIncome: false, category: Category.defaults[21]) // Example expense transaction
        ]
    }
    
}


