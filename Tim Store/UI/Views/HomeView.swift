//
//  HomeView.swift
//  Tim Store
//
//  Created by Godwin IE on 05/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    let columns = [GridItem(.adaptive(minimum: 140))]
    
    struct testItem: Identifiable {
        let id = UUID()
        let name: String
        let description: String
        let photos: String
    }
    
    let testItems = [
        testItem(name: "Wahala", description: "Plenty wahala", photos: "logo"),
        testItem(name: "Wahala", description: "Plenty wahala", photos: "logo"),
        testItem(name: "Wahala", description: "Plenty wahala", photos: "logo"),
        testItem(name: "Wahala", description: "Plenty wahala", photos: "logo"),
    ]

    var body: some View {
        VStack(spacing: 24) {
            Image("logo")
                .resizable()
                .frame(width: 34, height: 34)
                .scaledToFit()
            
            ScrollView(showsIndicators: false) {
                LazyVGrid (columns: columns) {
                    ForEach(testItems) { item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                            
                            Image(item.photos)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130)
                                .padding(.vertical, 20)
                            
                            Spacer()
                            
                            HStack {
                                //Text("$\(item.price, specifier: "%.2f")")
                                Text("$$$")
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(.black)
                                
                                Spacer()
                                
                                AddButton(icon: "plus") {}
                            }
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(16)
                        .background(.gray.opacity(0.05))
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 24)))
                    }
                }
            } // Vgrid
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    HomeView()
}
