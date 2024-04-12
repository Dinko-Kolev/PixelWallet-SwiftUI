//
//  CategoryCellView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//

import SwiftUI

struct CategoryCellView: View {

    var category: Category
    let labelColor = LinearGradient(gradient: Gradient(colors: [.white, .mint]),startPoint: .topTrailing, endPoint: .bottom)
    var body: some View {
        
        
        HStack{
            Text(category.name)
             .padding(8)
             .font(.headline)
            Spacer()
            Image(systemName: category.symbol)
               .padding(8)
               .font(.title)
               .foregroundColor(Color.blue)
        } 
        
    }
}


#Preview {
    CategoryCellView(category:  Category(name: "Fitness", symbol: "🏋️‍♂️"))
}
