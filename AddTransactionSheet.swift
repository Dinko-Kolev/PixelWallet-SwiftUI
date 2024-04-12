//
//  AddTransactionSheet.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 3/4/24.
//

import SwiftUI
import SwiftData
struct AddTransactionSheet: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var amount: Double = 0.00
    @State var date: Date = Date()
    @State var selectedCategory: Category = Category(name: "Income", symbol: "dollarsign.circle.fill")
    @Query var categories: [Category]
    @State private var selectedTypeOfTransaction: Transaction.typeOfTransaction = .expense
    @State private var isIncome: Bool = false
    
    var body: some View {
        NavigationStack{
        Form{
            Section(header: Text("Transaction Details")) {
                // Date picker
                    DatePicker("Start Date", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                
                // Picker / Type of transaction
                Picker("Inc or Exp", selection: $selectedTypeOfTransaction) {
                    ForEach(Transaction.typeOfTransaction.allCases, id: \.self) { value in
                        Text(value.rawValue).tag(value)
                    }
                }
                .pickerStyle(.palette)
                .onChange(of: selectedTypeOfTransaction) { newValue, _ in
                    if newValue == .income {
                        isIncome = false
                    } else {
                        isIncome = true
                    }
                }
                Text("Is Income: \(isIncome.description)")
            
                
               //Description
                VStack{
                    Text("Description")
                    TextField("Description", text: $title)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.leading)
                    
                }
              
                // Amount
                
                VStack{
                    Text("Amount")
                    TextField("Amount", value: $amount, format: .currency(code: "EUR")).keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        
                    
                }
                
                
               
                
            
                //Category Picker
                
                if !isIncome {
                              
                              
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories) { category in
                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text(category.name).tag(category.name)
                            }
                            Spacer() // Add Spacer to push the following VStack to the right
                            Image(systemName: category.symbol)
                                .tag(category.symbol)
                                .foregroundColor(Color.blue)
                                .font(.title)
                                
                        }
                        .tag(category)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                       
                    }
                }
                .pickerStyle(.navigationLink) // Adjust picker style
              
                }
            }
        }
            .navigationTitle("New Transaction")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let transaction = Transaction(id: UUID().uuidString,
                                                      title: title,
                                                      amount: amount,
                                                      date: date,
                                                      isIncome: isIncome,
                                                      category: selectedCategory)
                        print(transaction.isIncome)
                        // Save the transaction to your data store
                        modelContext.insert(transaction)
                        dismiss()
                    }
                }
            }
            
            
        }
        
        
        
        
        
    }
    
}
    #Preview {
        AddTransactionSheet( selectedCategory: Category(name: "Income", symbol: "figure.stand.circle.fill"))
    }
    
