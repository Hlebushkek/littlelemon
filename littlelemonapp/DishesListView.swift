//
//  DishesListView.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

struct DishesListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var dishesModel = DishesModel()
    
    @State private var showAlert = false
    @State var searchText = ""
    
    var body: some View {
        FetchedObjects(
            predicate: buildPredicate(),
            sortDescriptors: buildSortDescriptors()
        ) {
            (dishes: [Dish]) in
            List {
                ForEach(dishes) { dish in
                    DishItemView(dish)
                        .onTapGesture {
                            showAlert.toggle()
                        }
                }
            }
            .searchable(text: $searchText, prompt: "search...")
        }
        .scrollContentBackground(.hidden)
        .task {
            await dishesModel.reload(viewContext)
        }
        .alert("Order placed, thanks!",
               isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func buildPredicate() -> NSPredicate {
        return searchText == "" ?
                NSPredicate(value: true) :
                NSPredicate(format: "name CONTAINS[cd] %@", searchText)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "name",
                          ascending: true,
                          selector: #selector(NSString.localizedStandardCompare))]
    }
}

extension DishesListView {
    struct DishItemView: View {
        @ObservedObject private var dish: Dish
        
        init(_ dish: Dish) {
            self.dish = dish
        }
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(dish.name ?? "")
                    .font(.title3.bold())
                
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(dish.dishDescription ?? "")
                            .foregroundStyle(.secondary)
                        Text(String(format: "$%.02f", dish.price))
                    }
                    
                    Spacer()
                    
                    Group {
                        if let url = URL(string: dish.image ?? "") {
                            AsyncImage(url: url) { image in
                                switch image {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                default:
                                    Color.gray
                                }
                            }
                        } else {
                            Image("Greek salad")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    .frame(width: 96, height: 96)
                    .clipped()
                }
            }
        }
    }
}

#Preview {
    DishesListView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
