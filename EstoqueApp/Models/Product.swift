//
//  Product.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 14/12/22.
//

import Foundation
import SwiftUI

struct Product {
    var name: String
    var image: UIImage?
    var quantity: Int
    var unityMeasure: UnityMeasure
    var unityText: String {
        switch unityMeasure {
        case .units:
            return "unidades"
        case .meters:
            return "metros"
        case .kilograms:
            return "quilogramas"
        }
    }
    
    mutating func increaseQuantity() {
        self.quantity += 1
    }
    
    mutating func decreaseQuantity() {
        self.quantity -= 1
    }
}

enum UnityMeasure {
    case kilograms
    case meters
    case units
}
