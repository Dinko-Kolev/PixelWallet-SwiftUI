//
//  CategoriesContainer.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 3/4/24.
//

import Foundation
import SwiftData

actor ItemsContainer {
    
    private static let hasAddedDataKey = "hasAddedData"
    
    @MainActor
    static func create() -> ModelContainer {
        // Check if data has already been added
        let hasAddedData = UserDefaults.standard.bool(forKey: hasAddedDataKey)
        guard !hasAddedData else {
            // Data has already been added, return empty container
            let schema = Schema([
                Item.self,
                Category.self,
                Transaction.self
            ])
            let configuration = ModelConfiguration()
            return try! ModelContainer(for: schema, configurations: configuration)
        }
        
        // Data has not been added, add it and update flag
        do {
            let schema = Schema([
                Item.self,
                Category.self,
                Transaction.self
            ])
            let configuration = ModelConfiguration()
            let container = try ModelContainer(for: schema, configurations: configuration)
            
            // Insert default categories
            Category.defaults.forEach { container.mainContext.insert($0) }
            
            // Insert default transactions
            Transaction.defaults.forEach { container.mainContext.insert($0) }
            
            // Update flag
            UserDefaults.standard.set(true, forKey: hasAddedDataKey)
            
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
