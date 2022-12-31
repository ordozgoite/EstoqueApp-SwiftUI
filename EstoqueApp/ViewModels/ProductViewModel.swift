//
//  ProductListViewModel.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 14/12/22.
//

import Foundation
import SwiftUI

struct ProductViewModel: Identifiable {
    
    var product: Product
    
    let id = UUID()
    
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
        if product.quantity != 0 {
            product.decreaseQuantity()
        }
    }
}
