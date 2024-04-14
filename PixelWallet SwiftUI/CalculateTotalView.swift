//
//  CalculateTotalView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 14/4/24.
//

import SwiftUI
import SwiftData
struct CalculateTotalView: View {
    
    @Environment(\.modelContext) private var modelContext
      @State private var isShowingTransactionSheet = false
      @Query(sort: \Transaction.id) private var transactions: [Transaction]
      
      
      @Binding var currentMonth: Date
      let calendar = Calendar.current
      let today = Calendar.current.component(.day, from: Date())
      let labelColor = LinearGradient(gradient: Gradient(colors: [.white, .mint, .green]), startPoint: .zero, endPoint: .bottom)
    
    
    
    
    var body: some View {
       
        
        
        
        VStack{
            // Calculate total income, total expense, and balance for the current month
            let totalIncome = transactions
                .filter { $0.isIncome && calendar.isDate($0.date, equalTo: currentMonth, toGranularity: .month) }
                .reduce(0) { $0 + $1.amount }
            
            let totalExpense = transactions
                .filter { !$0.isIncome && calendar.isDate($0.date, equalTo: currentMonth, toGranularity: .month) }
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
        
        
        
        
    }
}

//#Preview {
//    CalculateTotalView(currentMonth: $currentMonth)
//}
