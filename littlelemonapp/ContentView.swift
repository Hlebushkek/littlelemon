//
//  ContentView.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationStack {
            OrderingView()
                .ignoresSafeArea()
                .padding(.top, 0.5)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("Logo")
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            ScrollView {
                                ProfileView()
                                    .padding(.horizontal)
                            }
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Image("Logo")
                                }
                            }
                        } label: {
                            Image("Profile")
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 32, height: 32)
                                .clipShape(.rect(cornerRadius: 16))
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
