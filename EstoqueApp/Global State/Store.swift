//
//  Store.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 28/12/22.
//

import Foundation
import SwiftUI

class Store: ObservableObject {
    
    @Published var productsList: [ProductViewModel] = [ProductViewModel]()
    
    init() {
        productsList = [
            ProductViewModel(product: Product(name: "Coca-Cola Zero", image: UIImage(named: "coke"), quantity: 120, unityMeasure: .units)),
            ProductViewModel(product: Product(name: "Bolacha Maizena", image: UIImage(named: "maizena"), quantity: 50, unityMeasure: .units)),
            ProductViewModel(product: Product(name: "Garrafão de água 20L", image: UIImage(named: "water"), quantity: 20, unityMeasure: .units))
        ]
    }
    
    func addProduct(_ product: ProductViewModel) {
        productsList.append(product)
    }
}
