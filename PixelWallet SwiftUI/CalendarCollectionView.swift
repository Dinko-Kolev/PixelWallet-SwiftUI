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
   
      
      var body: some View {
          ScrollView {
              CalculateTotalView( currentMonth: $currentMonth)

              
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
              
            
              LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 1) {
                  ForEach(daysOfMonth(), id: \.self) { day in
                      if day == 0 {
                          Color.clear
                          // Placeholder for empty spaces at the beginning of the month
                      } else {
                          VStack {
                              Text("\(day)")
                                  .frame(width: 40.0, height: 10)
                                  .font(.system(size: 14))
                              
                              // Calculate the number of transactions and balance for the current day
                              let dayTransactions = transactions.filter { calendar.isDate($0.date, equalTo: currentMonth, toGranularity: .month) && calendar.component(.day, from: $0.date) == day }
                              let dayIncome = dayTransactions.filter { $0.isIncome }.reduce(0) { $0 + $1.amount }
                              let dayExpense = dayTransactions.filter { !$0.isIncome }.reduce(0) { $0 + $1.amount }
                              let dayBalance = dayIncome - dayExpense
                              
                              Text("Trans: \(dayTransactions.count)\nBal: \(dayBalance.roundDouble())")
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
            
          
      }
      
    func daysOfMonth() -> [Int] {
        let firstDayOfMonth = calendar.component(.weekday, from: currentMonth.startOfMonth())
        let range = calendar.range(of: .day, in: .month, for: currentMonth)!
        let days = range.map { $0 }
        let emptySpacesCount = (firstDayOfMonth - 2 + 7) % 7
        let emptySpaces = Array(repeating: 0, count: emptySpacesCount)
        return emptySpaces + days
    }
  }




  struct CalendarCollectionView_Previews: PreviewProvider {
      static var previews: some View {
          CalendarCollectionView()
      }
  }

