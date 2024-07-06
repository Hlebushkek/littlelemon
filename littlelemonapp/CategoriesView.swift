//
//  CategoriesView.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var category: DishCategory?
    
    var body: some View {
        VStack {
            HStack {
                Text("Order for Delivery:".uppercased())
                    .font(.title3.bold())
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(DishCategory.allCases) { cat in
                        Text("\(cat.rawValue.capitalized)s")
                            .bold()
                            .padding(12)
                            .background(category == cat ? Color.approvedGreen : Color.gray.opacity(0.25))
                            .foregroundStyle(category == cat ? Color.white : Color.approvedGreen)
                            .clipShape(.rect(cornerRadius: 16))
                            .onTapGesture {
                                if category == cat {
                                    category = nil
                                } else {
                                    category = cat
                                }
                            }
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CategoriesView(category: .constant(.dessert))
}
