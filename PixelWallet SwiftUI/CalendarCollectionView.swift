//
//  CalendarCollection.swift
//  Pixel Wallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 1/4/24.
//

import SwiftUI
import SwiftData
struct CalendarCollectionView: View {
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
              .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
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
              
              LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 1) {
                  ForEach(daysOfMonth(), id: \.self) { day in
                      if day == 0 {
                          Color.clear
                          // Placeholder for empty spaces at the beginning of the month
                      } else {
                          VStack {
                              Text("\(day)")
                                  .frame(width: 40.0, height: 10)
                                  .font(.system(size: 14))
                              
                       
                              
                              Text("Trans: \n Bal: ")
                                  .frame(width: 40, height: 50)
                                  .font(.system(size: 8))
                          }
                          .padding(6)
                          .frame(width: nil)
                          .background(day <= today ? Color.purple : Color.blue)
                          .foregroundColor(.white)
                          .cornerRadius(10)
                      }
                  }
              }
              .padding()
          }
          .navigationTitle("Days of the Month")
          
       
      }
      
    func daysOfMonth() -> [Int] {
        let firstDayOfMonth = calendar.component(.weekday, from: currentMonth.startOfMonth())
        let range = calendar.range(of: .day, in: .month, for: currentMonth)!
        let days = range.map { $0 }
        let emptySpacesCount = (firstDayOfMonth - 2 + 7) % 7
        let emptySpaces = Array(repeating: 0, count: emptySpacesCount)
        return emptySpaces + days
    }  }

  extension Date {
      func startOfMonth() -> Date {
          let calendar = Calendar.current
          let components = calendar.dateComponents([.year, .month], from: self)
          return calendar.date(from: components)!
      }
      
      func monthAsString() -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "MMMM"
          return dateFormatter.string(from: self)
      }
      
      func yearAsString() -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "yyyy"
          return dateFormatter.string(from: self)
      }
  }

    struct CalendarCollectionView_Previews: PreviewProvider {
        static var previews: some View {
            CalendarCollectionView()
        }
}

#Preview {
    CalendarCollectionView()
}
