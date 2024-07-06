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
                        .font(.title)
                    .fontWeight(.medium)
                    
//                    if let price =
//                        product.current_price.first?.NGN.first {
//                        Text("NGN \(price ?? 0.0, specifier: "%.2f")")
//                            .foregroundStyle(.gray)
//                    }
                } // name and price
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("DESCRIPTION")
                            .foregroundStyle(.gray)
                        
                        if let description = product.description {
                            Text(description)
                                .lineSpacing(6)
                        }
                    }
                }
                
                //Spacer()
                
                HStack {
                    PrimaryButton(title: "Add to cart") {}
                    
                    if product.is_available {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("AVAILABILITY")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                            
                            HStack {
                                Circle()
                                    .foregroundStyle(.green)
                                    .frame(width: 8)
                                
                                Text("Item is available")
                                    .foregroundStyle(.green)
                            }
                        }
                        .frame(maxWidth: .infinity)

                    }
                }

            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

#Preview {
    DetailView(
    product: ItemsModel(
        id: "",
        name: "Nike Pegasus",
        description: 
        """
        Experience the Nike Air Zoom Pegasus 39, a perfect blend of comfort, style, and performance. Designed for runners of all levels, this shoe offers superior cushioning and support, making every stride feel effortless.
        
        SPECIFICATIONS:
        Weight: 10.2 oz
        Drop: 10mm
        Available Sizes: 7-15
        Color: Blue
        """,
        is_available: true,
        photos: [PhotoModel(url: "godwin/product_max_90_flyease_b505de_1.jpg")]
        //current_price: [PriceModel(NGN: [5000])]
    )
    )
}

