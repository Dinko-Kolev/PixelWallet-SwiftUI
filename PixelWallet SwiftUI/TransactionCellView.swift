//
//  TransactionCellView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 3/4/24.
//
//
import SwiftUI

struct TransactionCellView: View {
    
    var transaction: Transaction
  
    var body: some View {
          let isIncome = transaction.isIncome // Initialize isIncome here
          

     
          HStack {
              VStack {
                  Text(transaction.date.formatted(date: .abbreviated, time: .omitted))
                      .font(.caption)
                      
                  
                 
              }
             
                  
              VStack(alignment: .center) {
                  Image(systemName: transaction.category?.symbol ?? "questionmark.square.dashed") // Display category symbol here
                      .foregroundColor(Color.blue)
                  
                  Text(transaction.category?.name ?? "No category")
                      .font(.caption)
                      .frame(alignment: .leading) // Align category name to the left
              }.padding(12)
              Spacer()
              VStack(alignment: .trailing) {
                  Text(transaction.title)
                      .font(.caption2)
                      .lineLimit(4) // Limiting to max 4 lines of text
              }
              Spacer() // Add Spacer to push the following VStack to the right
              VStack(alignment: .trailing) {
                  Text( isIncome ? transaction.amount.roundDouble() + "€": "-" + transaction.amount.roundDouble() + "€")
                      .foregroundColor(isIncome ? .green : .red) // Change color based on condition
              }
          }
      }
  }

#Preview {
    TransactionCellView( transaction: Transaction(title: "Salary", amount: 2500.00, date: Date(), isIncome: true, category: Category(name: "Income", symbol: "symbol")))
}
