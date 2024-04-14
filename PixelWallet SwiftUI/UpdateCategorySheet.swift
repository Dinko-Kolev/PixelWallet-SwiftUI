//
//  UpdateCategorySheet.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 3/4/24.


import SwiftUI
import SwiftData

struct UpdateCategorySheet: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
  
    @Bindable var category: Category
    @State var selectedSymbol: String?
    
    var body: some View {
        
        NavigationStack{
            
            Spacer(minLength: 66)
            Form{
            
                TextField(" Category name", text: $category.name)
                //Symbol Picker
                Picker("Symbol", selection: $category.symbol) {
                    ForEach(Category.symbols, id: \.utf8CString) { symbol in
                        Image(systemName: symbol)
                            .tag(symbol)
                            
                           
                                      
                    }
                }
                .pickerStyle(.wheel) // Adjust picker style
    
            }
            .navigationTitle("Update Category")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading){
                    Button("Cancel"){dismiss()}
                }
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Save"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    UpdateCategorySheet(category: Category(name: "Rent", symbol: "something"), selectedSymbol: "house.fill")
    
}
