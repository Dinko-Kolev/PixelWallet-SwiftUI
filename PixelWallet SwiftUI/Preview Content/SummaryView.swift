//
//  SummaryView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 12/4/24.
//

import SwiftUI

struct SummaryView: View {
    let totalIncome: Double
    let totalExpense: Double
    let balance: Double

    var body: some View {
        VStack {
            Text("Income:  \(totalIncome)")
            Text("Expense: \(totalExpense)")
            Text("Balance: \(balance)")
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        .padding(.bottom, 20)
        .foregroundColor(.black)
        .background(LinearGradient(gradient: Gradient(colors: [.white, .mint, .green]), startPoint: .zero, endPoint: .bottom))
        .cornerRadius(20, corners: [.topLeft,.topRight])
    }
}
