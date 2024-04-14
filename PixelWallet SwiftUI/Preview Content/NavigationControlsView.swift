//
//  NavigationControlsView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 12/4/24.
//

import SwiftUI

struct NavigationControlsView: View {
    @Binding var currentMonth: Date
    private let calendar = Calendar.current

    var body: some View {
        HStack {
            Button(action: {
                self.currentMonth = self.calendar.date(byAdding: .month, value: -1, to: self.currentMonth)!
            }) {
                Image(systemName: "arrowshape.backward.circle")
            }
            Text("\(currentMonth.monthAsString()) \(currentMonth.yearAsString())")
            Button(action: {
                self.currentMonth = self.calendar.date(byAdding: .month, value: 1, to: self.currentMonth)!
            }) {
                Image(systemName: "arrowshape.forward.circle")
            }
        }
        .padding(.horizontal)
    }
}
