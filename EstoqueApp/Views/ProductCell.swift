//
//  ProductCell.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 18/12/22.
//

import SwiftUI

struct ProductCell: View {
    
    @State var product: ProductViewModel
    
    var body: some View {
        HStack {
            Image(uiImage: (product.image ?? UIImage(named: "no_image"))!)
                .resizable()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                Text(product.name)
                Text("\(product.quantity) \(product.unityText)")
                    .padding(.top, 5)
            }
            
            Spacer()
            
            Stepper("") {
                product.increaseQuantity()
            } onDecrement: {
                product.decreaseQuantity()
            }

        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: ProductViewModel(product: Product(name: "Coca-Cola Zero", image: UIImage(named: "coke"), quantity: 10, unityMeasure: .units)))
    }
}
