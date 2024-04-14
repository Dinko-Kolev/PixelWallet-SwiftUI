//
//  Extensions.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 6/4/24.
//

import Foundation
import SwiftUI


extension Double {
    
    func roundDouble() -> String {
        return String(format: "%.0.2f", self)
    }
    
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius:radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    
    
}


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
