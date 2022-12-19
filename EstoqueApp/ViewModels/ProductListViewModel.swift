//
//  ProductListViewModel.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 14/12/22.
//

import Foundation
import SwiftUI

class ProductListViewModel: ObservableObject {
    
    @Published var products = [ProductViewModel]()
    
    func getAllProducts() {
        products = [
            ProductViewModel(product: Product(name: "Coca-Cola Zero", image: UIImage(named: "coke"), quantity: 120, unityMeasure: .units)),
            ProductViewModel(product: Product(name: "Bolacha Maizena", image: UIImage(named: "maizena"), quantity: 50, unityMeasure: .units)),
            ProductViewModel(product: Product(name: "Garrafão de água 20L", image: UIImage(named: "water"), quantity: 20, unityMeasure: .units))
        ]
    }
    
    func incrementQuantity(index: Int) {
        self.products[index].product.quantity += 1
    }
    
    func decrementQuantity(index: Int) {
        self.products[index].product.quantity -= 1
    }
}

struct ProductViewModel {
    
    var product: Product
    
    var name: String {
        product.name
    }
    
    var quantity: Int {
        product.quantity
    }
    
    var image: UIImage? {
        product.image ?? UIImage(named: "no_image")
    }
    
    var unityMeasure: UnityMeasure {
        product.unityMeasure
    }
    
    var unityText: String {
        product.unityText
    }
    
    mutating func increaseQuantity() {
        product.increaseQuantity()
    }
    
    mutating func decreaseQuantity() {
        product.decreaseQuantity()
    }
}
