//
//  ProductListView.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 18/12/22.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject private var productListVM = ProductListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(0 ..< productListVM.products.count, id: \.self) { index in
                        ProductCell(product: productListVM.products[index])
                    }
                }
            }
            .onAppear {
                productListVM.getAllProducts()
            }
            .toolbar {
                NavigationLink(destination: AddProductScreen()) {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
            
            .navigationTitle("Produtos")
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
