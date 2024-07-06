//
//  DetailView.swift
//  Tim Store
//
//  Created by Godwin IE on 06/07/2024.
//

import SwiftUI

struct DetailView: View {
    var product: ItemsModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 18) {
                
                if let imageUrl = product.photos.first?.url,
                    let url = URL(string: "https://api.timbu.cloud/images/\(imageUrl)") {
                    
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 240)
                            .background(.gray.opacity(0.1))
                            .cornerRadius(24)
                        
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .frame(height: 260)
                            .background(.gray.opacity(0.1))
                            .cornerRadius(24)
                    }
                }
                                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    if let firstPriceValue = product.currentPrice.first?.NGN.first {
                        // handle different PriceValue cases
                        switch firstPriceValue {
                        case .double(let value):
                            Text("NGN \(value, specifier: "%.2f")")
                                .foregroundStyle(.gray)
                        case .array(let values):
                            // format array of doubles into a string
                            let formattedValues = values.map { String($0) }.joined(separator: ", ")
                            Text("NGN [\(formattedValues)]")
                        case .empty:
                            Text("N/A")
                                .foregroundColor(.red)
                        }
                        
                    } else {
                        Text("N/A")
                            .foregroundColor(.red)
                    }
                } // name and price
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("DESCRIPTION")
                            .foregroundStyle(.gray)
                            .font(.callout)
                        
                        if let description = product.description {
                            Text(description)
                                .lineSpacing(6)
                        }
                    }
                }
                
                //Spacer()
                
                HStack {
                    PrimaryButton(title: "Add to cart") {}
                    
                        VStack(alignment: .leading, spacing: 4) {
                            Text("AVAILABILITY")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                            
                            HStack {
                                Circle()
                                    .frame(width: 8)
                                
                                Text("Item is \(product.isAvailable ? "available" : "Unavailable")")
                            }
                            .foregroundStyle(product.isAvailable ? .green : .gray)

                        }
                        .frame(maxWidth: .infinity)

                }

            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    DetailView(
//    product: ItemsModel(
//        id: "",
//        name: "Nike Pegasus",
//        description: 
//        """
//        Experience the Nike Air Zoom Pegasus 39, a perfect blend of comfort, style, and performance. Designed for runners of all levels, this shoe offers superior cushioning and support, making every stride feel effortless.
//        
//        SPECIFICATIONS:
//        Weight: 10.2 oz
//        Drop: 10mm
//        Available Sizes: 7-15
//        Color: Blue
//        """,
//        isAvailable: true,
//        photos: [PhotoModel(url: "godwin/product_max_90_flyease_b505de_1.jpg")],
//        currentPrice: product.currentPrice.first?.NGN.first
//    )
//    )
//}

