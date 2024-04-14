//
//  Transactions.swift
//  Pixel Wallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//

import SwiftUI
import SwiftData

struct TransactionsView: View {
    
     @Environment(\.modelContext) private var modelContext
     @State private var isShowingTransactionSheet = false
    @Query(sort: \Transaction.id) private var transactions: [Transaction]
     @State private var transactionToEdit: Transaction?
    @Query(sort: \Category.id) private var categories: [Category]
    
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
              
                 
                 
                 ForEach(transactions) { transaction in
                     TransactionCellView(transaction: transaction)
                         .onTapGesture {
                             transactionToEdit = transaction
                             
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
             .sheet(isPresented: $isShowingTransactionSheet) {
                 AddTransactionSheet()
             }
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     Button(action: {
                         isShowingTransactionSheet = true
                     }) {
                         Text("Add Transaction")
                         Image(systemName: "plus")
                     }
                 }
             }
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
         .modelContainer(for: Transaction.self, inMemory: true)
 }


    
    

