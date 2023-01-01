//
//  ProductCell.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 18/12/22.
//

import SwiftUI

struct ProductCell: View {
    
    @State var product: ProductViewModel
    @State private var textRect = CGRect()
    @FocusState var isInputActive: Bool
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        HStack {
            // IMAGE
            Image(uiImage: (product.image ?? UIImage(named: "no_image"))!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                // NAME
                Text(product.name)
                    .font(.title3)
                    .bold()
                // QUANTITY
                HStack {
                    TextField("", value: $product.product.quantity, formatter: formatter)
                        .fixedSize()
                        .focused($isInputActive)
                        .keyboardType(.numberPad)
                    
                    Text(product.unityText)
                    
                    if isInputActive {
                        Button("OK") {
                            isInputActive = false
                        }
                    }
                }
            }
            
            Spacer()
            // STEPPER
            Stepper("") {
                product.increaseQuantity()
            } onDecrement: {
                product.decreaseQuantity()
            }
            .fixedSize()
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: ProductViewModel(product: Product(name: "Coca-Cola Zero", image: UIImage(named: "coke"), quantity: 8, unityMeasure: .meters)))
    }
}
