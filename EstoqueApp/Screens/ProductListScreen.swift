//
//  ProductListView.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 14/12/22.
//

import SwiftUI

struct ProductListScreen: View {
    
    @ObservedObject private var productListVM = ProductListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .toolbar(content: {
                NavigationLink(destination: AddProductScreen()) {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            })
            
            .navigationTitle("Products")
        }
        .onAppear {
            productListVM.getAll()
        }
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductListScreen()
    }
}
