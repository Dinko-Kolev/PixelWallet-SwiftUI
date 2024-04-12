//
//  MainView.swift
//  PixelWallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedTab = "Main"
   
    var body: some View {
    
        TabView(selection: $selectedTab){
           CalendarView()
                .tabItem{
                    Label ("Calendar", systemImage: "calendar")
                        .symbolEffect(.bounce, value: 1)
                }
            
           TransactionsView()
                 .tabItem{
                     Label ("Transactions", systemImage: "creditcard.fill")
                         .symbolEffect(.bounce, value: 1)
                 }
            CategoriesView()
                 .tabItem{
                     Label ("Categories", systemImage: "square.grid.3x3.fill")
                         .symbolEffect(.bounce, value: 1)
                 }
            ChartsView()
                 .tabItem{
                     Label ("Charts", systemImage: "chart.pie.fill")
                         .symbolEffect(.bounce, value: 1)
                 }
            SettingsView()
                 .tabItem{
                     Label ("Settings", systemImage: "gear")
                         .symbolEffect(.bounce, value: 1)
                 }
         
            
            
            
        }
        
        
        
    }
}

#Preview {
    MainView()
       
}

