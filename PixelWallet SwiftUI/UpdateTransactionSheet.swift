//
//  UpdateTransactionSheet.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 3/4/24.
//

import SwiftUI
import SwiftData

struct UpdateTransactionSheet: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable var transaction: Transaction
    @State private var selectedTypeOfTransaction: Transaction.typeOfTransaction = .expense
    @State private var isIncome: Bool = false
    
    var categories = Category.defaults // Assuming you have an array of default categories
    
    var body: some View {
        NavigationView {
            content
                .navigationTitle("New Transaction")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") { dismiss() }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            dismiss()
                        }
                    }
                }
        }
    }
    
    private var content: some View {
        Form {
            Section {
                // Date picker
                DatePicker("Start Date", selection: $transaction.date, displayedComponents: [.date])
                
                // Picker / Type of transaction
                transactionTypePicker
                
                Text("Is Income: \(isIncome.description)")
                
                // Description
                VStack(alignment: .leading) {
                    Text("Description")
                    TextField("Description", text: $transaction.title)
                        .textFieldStyle(.roundedBorder)
                }
                
                // Amount
                VStack(alignment: .center) {
                    Text("Amount")
                    TextField("Amount", value: $transaction.amount, format: .currency(code: "EUR"))
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                }
            }
            
            // Category Picker
            if !isIncome {
                categoryPicker
            }
        }
    }
    
    private var transactionTypePicker: some View {
        Picker("Inc or Exp", selection: $selectedTypeOfTransaction) {
            ForEach(Transaction.typeOfTransaction.allCases, id: \.self) { value in
                Text(value.rawValue).tag(value)
            }
        }
        .pickerStyle(.palette)
        .onChange(of: selectedTypeOfTransaction) { newValue in
                   isIncome = newValue == .income
               }
    }
    
    private var categoryPicker: some View {
        Picker("Category", selection: $transaction.category) {
            ForEach(categories) { category in
                HStack {
                    Text(category.name)
                    Spacer()
                    Text(category.symbol)
                        .font(.caption)
                }
                .tag(category)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    UpdateTransactionSheet(transaction: Transaction(title: "Salary", amount: 3000.00, date: Date(), isIncome: true, category: Category.defaults[0]))
}
