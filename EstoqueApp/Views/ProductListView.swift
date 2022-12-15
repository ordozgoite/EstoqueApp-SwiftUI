//
//  ProductListView.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 14/12/22.
//

import SwiftUI

struct ProductListView: View {
    
    @ObservedObject var productListVM = ProductListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0 ..< productListVM.products.count, id: \.self) { index in
                        
                        let product = productListVM.products[index].product
                        
                        HStack {
                            // IMAGE
                            Image(uiImage: (product.image ?? UIImage(named: "no_image"))!)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(5)
                            
                            VStack(alignment: .leading) {
                                // NAME
                                Text(product.name)
                                
                                // QUANTITY
                                Text("\(product.quantity) \(product.unityText)")
                                    .padding(.top, 5)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            // STEPPER
                            Stepper {} onIncrement: {
                                self.productListVM.incrementQuantity(index: index)
                            } onDecrement: {
                                self.productListVM.decrementQuantity(index: index)
                            }
                        }
                    }
                }
            }
            .toolbar(content: {
                NavigationLink(destination: AddProductView()) {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            })
            
            .navigationTitle("Products")
        }
        .onAppear {
            productListVM.getAllProducts()
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
