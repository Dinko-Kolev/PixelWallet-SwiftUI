//
//  GraphicsView.swift
//  Pixel Wallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//
import SwiftUI
import SwiftData

struct ChartsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @State private var isShowingTransactionSheet = false
    @Query(sort: \Transaction.id) private var transactions: [Transaction]
    
    
    @State private var currentMonth: Date = Date()
    let calendar = Calendar.current
    let today = Calendar.current.component(.day, from: Date())
    let labelColor = LinearGradient(gradient: Gradient(colors: [.white, .mint, .green]),startPoint: .zero, endPoint: .bottom)
    
    var body: some View {
        ScrollView {
           VStack{
                // Calculate total income, total expense, and balance for the current month
                let totalIncome = transactions
                    .filter { $0.isIncome && Calendar.current.isDate($0.date, equalTo: currentMonth, toGranularity: .month) }
                    .reduce(0) { $0 + $1.amount }
                
                let totalExpense = transactions
                    .filter { !$0.isIncome && Calendar.current.isDate($0.date, equalTo: currentMonth, toGranularity: .month) }
                    .reduce(0) { $0 + $1.amount }
                
                let balance = totalIncome - totalExpense
                
                // Display total income, total expense, and balance for the current month
                Text("Income:  " + totalIncome.roundDouble())
                Text("Expense: " + totalExpense.roundDouble())
                Text("Balance: " + balance.roundDouble())
                
             
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .padding(.bottom, 20)
            .foregroundColor(.black)
            .background(labelColor)
            .cornerRadius(20, corners: [.topLeft,.topRight])
            Spacer()
            HStack {
                // BackButton
                Button(action: {
                    self.currentMonth = self.calendar.date(byAdding: .month, value: -1, to: self.currentMonth)!
                }) {
                    Image(systemName: "arrowshape.backward.circle")
                    
                }
                
                // Current Month
                Text("\(currentMonth.monthAsString()) \(currentMonth.yearAsString())")
                
                // ForwardButton
                Button(action: {
                    self.currentMonth = self.calendar.date(byAdding: .month, value: 1, to: self.currentMonth)!
                }) {
                    Image(systemName: "arrowshape.forward.circle")
                }
            }
            .padding(.horizontal)
            
            
            
            ScrollView(.horizontal, showsIndicators: true){
                HStack(alignment: .bottom) {
                    // Display bar chart for each transaction category
                    ForEach(getTransactionCategories(), id: \.id) { category in
                        CategoryBarChart(category: category, transactions: transactions)
                    }
                }
            }
            
        }
    }
    
    // Function to get unique transaction categories
    private func getTransactionCategories() -> [Category] {
        let uniqueCategories = Array(Set(transactions.map { $0.category }))
        return uniqueCategories.compactMap { $0 }
    }
}

// Bar Chart for each category
struct CategoryBarChart: View {
    let category: Category
    let transactions: [Transaction]
    
    var body: some View {
        let totalAmount = getCategoryTotal()
        let barHeight = CGFloat(totalAmount) / 10 // Adjust divisor as needed
        
        VStack {
            Text(category.name)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 30, height: barHeight)
            Text(String(format: "%.2f", totalAmount))
        }
    }
    
    // Function to calculate total amount for the category
    private func getCategoryTotal() -> Double {
        let categoryTransactions = transactions.filter { $0.category == category }
        return categoryTransactions.reduce(0) { $0 + $1.amount }
    }
}

#Preview {
    ChartsView()
}
