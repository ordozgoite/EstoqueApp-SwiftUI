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
            // IMAGE
            Image(uiImage: (product.image ?? UIImage(named: "no_image"))!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                // NAME
                Text(product.name)
                // QUANTITY
                Text("\(product.quantity) \(product.unityText)")
                    .padding(.top, 5)
            }
            
            Spacer()
            // STEPPER
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
