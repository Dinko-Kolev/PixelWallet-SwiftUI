//
//  DonutChartView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 14/4/24.
//

import Charts
import SwiftUI
import SwiftData
struct DonutChartView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedCategory: Category?
    @Query(sort: \Transaction.id) private var transactions: [Transaction]
    @Query(sort: \Category.id) private var categories: [Category]

    var body: some View {
        NavigationStack {
            VStack {
                Chart(categories) { category in
                    SectorMark(
                        angle: .value(category.name, getCategoryTotal(category)),
                        innerRadius: .ratio(0.65),
                        outerRadius: selectedCategory?.name == category.name ? 175 : 150,
                        angularInset: 1
                    )
                    .foregroundStyle(.red.gradient) // Customize color as needed
                    .cornerRadius(10)
                }
            //    .chartAngleSelection(value: $selectedCategory)
                
                .chartBackground { _ in
                    if let selectedCategory = selectedCategory {
                        VStack {
                            Text(selectedCategory.name)
                                .font(.largeTitle)
                            Text("Total Expense: \(getCategoryTotal(selectedCategory))")
                                .font(.title)
                        }
                    } else {
                        Text("Select a category")
                            .font(.title3)
                    }
                }
                .frame(height: 350)
                if let selectedCategory = selectedCategory {
                    Text(selectedCategory.name)
                        .padding()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Expense Donut Chart")
        }
    }

    private func getCategoryTotal(_ category: Category) -> Double {
        let categoryTransactions = transactions.filter { $0.category == category && !$0.isIncome }
        return categoryTransactions.reduce(0) { $0 + $1.amount }
    }
}

struct DonutChartView_Previews: PreviewProvider {
    static var previews: some View {
        DonutChartView()
    }
}
