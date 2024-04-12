//
//  Main.swift
//  Pixel Wallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//

import SwiftUI
import SwiftData
struct CalendarView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isShowingTransactionSheet = false
   @Query(sort: \Transaction.id) private var transactions: [Transaction]
    @State private var currentMonth: Date = Date()

    
    
    var body: some View {
        ZStack{
            VStack{
             
            
                CalendarCollectionView()
                
                // Expenses Graph
                Spacer()
                Button(action: {
                    isShowingTransactionSheet = true
                }) {
                    Text("Add Transaction")
                    Image(systemName: "plus")
                }
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .buttonStyle(.automatic)
                .cornerRadius(10)
                  Spacer()
            }
            .sheet(isPresented: $isShowingTransactionSheet) {
                AddTransactionSheet()
            }
         
        }
    }
}

#Preview {
    CalendarView()
}
