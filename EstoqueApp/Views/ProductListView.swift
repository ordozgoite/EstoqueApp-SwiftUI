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
    @State private var alertIsPresented: Bool = false
    @State private var indexToDelete: IndexSet?
    
    var body: some View {
        NavigationStack {
            VStack {
                List($store.productsList, editActions: .delete) { $product in
                    if searchText == "" {
                        ProductCell(product: product)
                    } else {
                        if product.name.contains(searchText) {
                            ProductCell(product: product)
                        }
                    }
                }
            }
            .toolbar {
                Button {
                    addViewPresented = true
                } label: {
                    Image(systemName: "plus")
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
