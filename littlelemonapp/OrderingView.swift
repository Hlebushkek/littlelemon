//
//  OrderingView.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

struct OrderingView: View {
    @State private var category: DishCategory?
    
    var body: some View {
        VStack {
            HeroView()
                .padding()
                .background(Color.approvedGreen)
            
            CategoriesView(category: $category)
                .padding(.top, 32)
            
            DishesListView()
        }
    }
}

#Preview {
    NavigationStack {
        OrderingView()
    }
    .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
