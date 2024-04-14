//
//  CalendarGridView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 12/4/24.
//

//import SwiftUI
//
//struct CalendarGridView: View {
//    let daysOfMonth: [Int]
//    let currentMonth: Date
//    let today: Int
//    let transactions: [Transaction]
//
//    var body: some View {
//        LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 1) {
//            ForEach(daysOfMonth, id: \.self) { day in
//                if day == 0 {
//                    Color.clear
//                    // Placeholder for empty spaces at the beginning of the month
//                } else {
//                    DayCellView(day: day, currentMonth: currentMonth, today: today, transactions: transactions)
//                }
//            }
//        }
//        .padding()
//    }
//}
