//
//  CategoriesView.swift
//  Pixel Wallet SwiftUI
//
//  Created by Dinko Nikolaev Kolev on 2/4/24.
//

import SwiftUI
import SwiftData
struct CategoriesView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isShowingCategorySheet = false
    @Query(sort:\Category.id) var categories: [Category]
    
    @State private var categoryToEdit: Category?
    
    var body: some View {
          NavigationStack {
              List {
                  ForEach(categories) { category in
                      CategoryCellView(category: category)
                          .onTapGesture {
                              categoryToEdit = category
                          }
                  }
                  .onDelete { indices in
                      indices.forEach { index in
                          modelContext.delete(categories[index])
                      }
                  }
              }
              
              .navigationTitle("Categories")
              .navigationBarTitleDisplayMode(.large)
              .sheet(isPresented: $isShowingCategorySheet) {
                  AddCategorySheet(selectedSymbol: "drop.fill")
              }
              .sheet(item: $categoryToEdit) { category in
                  UpdateCategorySheet(category: category)
              }
              .toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                      Button(action: {
                          isShowingCategorySheet = true
                      }) {
                          Image(systemName: "plus")
                          Text("Add Category")
                      }
                  }
              }
              .overlay {
                  if categories.isEmpty {
                      ContentUnavailableView("No Categories", systemImage: "square.grid.3x3.fill")
                  }
              }
          }
      }
  }

  #Preview {
      CategoriesView()
          .modelContainer(for: Category.self, inMemory: true)
  }

