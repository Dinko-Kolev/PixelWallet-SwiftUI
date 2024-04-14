//
//  DayCellView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 12/4/24.
//

//
//import SwiftUI
//
//struct DayCellView: View {
//    let day: Int
//    let currentMonth: Date
//    let today: Int
//    let transactions: [Transaction]
//    private let calendar = Calendar.current
//
//    var body: some View {
//        VStack {
//            Text("\(day)")
//                .frame(width: 40.0, height: 10)
//                .font(.system(size: 14))
//
//            let dayTransactions = transactions.filter { transaction in
//                calendar.isDate(transaction.date, equalTo: currentMonth, toGranularity: .month) &&
//                    calendar.component(.day, from: transaction.date) == day
//            }
//            let dayIncome = calculateTotal(for: .income, transactions: dayTransactions)
//            let dayExpense = calculateTotal(for: .expense, transactions: dayTransactions)
//            let dayBalance = dayIncome - dayExpense
//
//            Text("Trans: \(dayTransactions.count)\nBal: \(dayBalance)")
//                .frame(width: 40, height: 50)
//                .font(.system(size: 8))
//        }
//        .padding(6)
//        .frame(width: nil)
//        .background(day <= today ? Color.purple : Color.blue)
//        .foregroundColor(.white)
//        .cornerRadius(10)
//    }
//
//    private func calculateTotal(for type: TransactionType, transactions: [Transaction]? = nil) -> Double {
//        let filteredTransactions = transactions ?? self.transactions
//        return filteredTransactions.filter { $0.isIncome == (type == .income) }
//            .reduce(0) { $0 + $1.amount }
//    }
//}
