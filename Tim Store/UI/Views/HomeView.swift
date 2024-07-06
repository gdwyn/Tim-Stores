//
//  HomeView.swift
//  Tim Store
//
//  Created by Godwin IE on 05/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    let columns = [GridItem(.adaptive(minimum: 140))]
    
    @State private var products: [ItemsModel] = []
    
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image("logo")
                    .resizable()
                    .frame(width: 34, height: 34)
                    .scaledToFit()
                
                if isLoading {
                    ProgressView()
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid (columns: columns) {
                            ForEach( products) { item in
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(item.name)
                                    
                                    if let imageUrl = item.photos.first?.url, 
                                        let url = URL(string: "https://api.timbu.cloud/images/\(imageUrl)") {
                                        
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 130)
                                                .padding(.vertical, 20)
                                        } placeholder: {
                                            ProgressView()
                                                .frame(width: 130)
                                                .frame(height: 90)
                                                .padding(.vertical, 20)
                                        }
                                    }
                                    
                                    
                                    Spacer()
                                    
                                    //                                    if let price =
                                    //                                        item.currentPrice.first?.NGN.first {
                                    //                                        Text("NGN \(price ?? 0.0, specifier: "%.2f")") // Adjusted to handle optional Double
                                    //                                            .bold()
                                    //                                            .multilineTextAlignment(.leading)
                                    //                                            .foregroundColor(.black)
                                    //                                    }
                                    
                                    Text("NGN 5,000")
                                        .bold()
                                        .foregroundStyle(.gray)
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(16)
                                .background(.gray.opacity(0.05))
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 24)))
                            }
                        }
                    } // Vgrid
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .task{
                await loadProducts()
        }
        }
        
    }
    
    private func loadProducts() async {
        
        isLoading = true
        
        do {
            
            let productsModel = try await getProducts()
                        
            products = productsModel.items // Update products array
                        
            isLoading = false
            
        } catch AppErrors.invalidData {
            
            errorMessage = "Invalid data"
            print(errorMessage as Any)
            
            isLoading = false
            
        } catch AppErrors.invalidResponse {
            
            errorMessage = "Invalid response"
            print(errorMessage as Any)
            
            isLoading = false
            
        } catch AppErrors.invalidURL {
            
            errorMessage = "Invalid URL"
            print(errorMessage as Any)
            
            isLoading = false
            
        } catch {
            errorMessage = "Something is wrong"
            print(errorMessage as Any)
            
            isLoading = false
        }
    }

}

#Preview {
    HomeView()
}

//// Mock data
//let mockItems = [
//    ItemsModel(
//        id: "1",
//        name: "Nike Zoom Pegasus",
//        description: "A great running shoe.",
//        photos: PhotoModel(url: "logo"),
//        currentPrice: [PriceModel(NGN: [15000.0])]
//    ),
//    ItemsModel(
//        id: "2",
//        name: "Max 90 Flyease",
//        description: "A versatile sneaker.",
//        photos: PhotoModel(url: "logo"),
//        currentPrice: [PriceModel(NGN: [24000.0])]
//    )
//]
