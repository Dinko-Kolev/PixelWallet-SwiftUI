//
//  DayTransactionsView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 14/4/24.
//

import SwiftUI
import SwiftData

struct DayTransactionsView: View {
    @Environment(\.modelContext) private var modelContext
   // @State private var isShowingTransactionSheet = false
    @Query(sort: \Transaction.id) private var transactions: [Transaction]
    @Binding private var selectedDayTransactions: [Transaction]

        
         var body: some View {
             NavigationStack {
                 HStack{
                     Text("Date")
                         .padding(8)
                         .font(.caption)
                    
                     Spacer()
                     Text("Category")
                         .padding(8)
                         .font(.caption)
                     Spacer()
                     Text("Description")
                         .padding(8)
                         .font(.caption)
                     Spacer()
                     Text("Amount")
                         .padding(8)
                         .font(.caption)
                 }.padding(30)
                 
                
                 List {
                  
                     
                     
                     ForEach(selectedDayTransactions) { transaction in
                         TransactionCellView(transaction: transaction)
                             .onTapGesture {
                                 
                                 
                             }
                     }
                     .onDelete { indices in
                         indices.forEach { index in
                             modelContext.delete(transactions[index])
                         }
                     }
                 }
                 .navigationTitle("Transactions")
                 .navigationBarTitleDisplayMode(.large)
              
            
                 .overlay {
                     if transactions.isEmpty {
                         ContentUnavailableView("No Transactions", systemImage: "list.bullet.rectangle.portrait")
                     }
                 }
             }
         }
     }

     #Preview {
         TransactionsView()
     }
