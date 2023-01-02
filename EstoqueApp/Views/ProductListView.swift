//
//  ProductListView.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 18/12/22.
//

import SwiftUI

struct ProductListView: View {
    
    @EnvironmentObject var store: Store
    @State private var addViewPresented: Bool = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach($store.productsList) { $product in
                        if searchText == "" {
                            ProductCell(product: product)
                        } else {
                            if product.name.contains(searchText) {
                                ProductCell(product: product)
                            }
                        }
                    }
                }
            }
            .toolbar {
                Image(systemName: "plus")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        addViewPresented = true
                    }
            }
            .sheet(isPresented: $addViewPresented, content: {
                AddProductScreen().environmentObject(store)
            })
            .navigationTitle("Produtos")
        }
        .searchable(text: $searchText, prompt: "Nome do produto")
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
            .environmentObject(Store())
    }
}
