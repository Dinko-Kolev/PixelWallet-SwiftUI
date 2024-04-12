//
//  AddCategorySheet.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//

import SwiftUI
import SwiftData

struct AddCategorySheet: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var symbol: String = ""
    @State var selectedSymbol: String
    
    
    
    
    var body: some View {
        
        NavigationStack{
            Spacer(minLength: 66)
            Form{
                TextField("Category Name", text:$name )
                //Symbol Picker
                Picker("Symbol", selection: $selectedSymbol) {
                    ForEach(Category.symbols, id: \.utf8CString) { symbol in
                        Image(systemName: symbol)
                            .tag(symbol)
                            
                           
                                      
                    }
                }
                .pickerStyle(.wheel) // Adjust picker style
            
            }
            .navigationTitle("New Category")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading){
                    Button("Cancel"){dismiss()}
                }
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Save"){
                        let category = Category(name: name, symbol: selectedSymbol) // Use selectedSymbol
                        modelContext.insert(category)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddCategorySheet(selectedSymbol: "drop.fill")
}
