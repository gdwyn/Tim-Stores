////
////  ContentView.swift
////  Tim Store
////
////  Created by Godwin IE on 05/07/2024.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var products: ProductsModel
//
//    var body: some View {
//        HomeView(products: products)
//            .task{
//                do {
//                    products = try await getProducts()
//                } catch {
//                    
//                }
//            }
//    }
//}
//
////#Preview {
////    ContentView(products: <#ProductsModel#>)
////}
