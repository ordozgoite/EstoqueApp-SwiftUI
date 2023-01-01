//
//  AddProductViewModel.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 29/12/22.
//

import Foundation
import SwiftUI

class AddProductViewModel: ObservableObject {
    
    @Published var productName: String = ""
    @Published var productQuantity: String = ""
    @Published var productUnity: UnityMeasure = .units
//    @Published var productImage: UIImage = UIImage(named: "no_image")!
    
    @Published var image: UIImage?
    
    func newProduct() -> ProductViewModel {
        let product = Product(name: productName, image: image ?? UIImage(named: "no_image")!, quantity: Int(productQuantity) ?? 0, unityMeasure: productUnity)
        let newProduct = ProductViewModel(product: product)
        return newProduct
    }
    
    func isValid() -> Bool {
        return productName != "" && productQuantity != ""
    }
}
