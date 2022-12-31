//
//  AddProductScreen.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 19/12/22.
//

import PhotosUI
import SwiftUI

struct AddProductScreen: View {
    
    @ObservedObject private var addProductVM = AddProductViewModel()
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var store: Store
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        VStack {
            Form {
                Section("NOME DO PRODUTO") {
                    TextField("Nome", text: $addProductVM.productName)
                }
                
                Section("QUANTIDADE") {
                    VStack {
                        TextField("Quantidade", text: $addProductVM.productQuantity)
                            .keyboardType(.numberPad)
                        Picker("Unidade de Medida", selection: $addProductVM.productUnity) {
                            ForEach(UnityMeasure.allCases, id: \.self) { unityMeasure in
                                Text(unityMeasure.name)
                            }
                        }
                    }
                }
                
                Section("Imagem") {
                    VStack {
                        PhotosPicker(
                            selection: $selectedItems,
                            maxSelectionCount: 1,
                            matching: .images
                        ) {
                            HStack {
                                Text("Escolha uma imagem")
                                    .foregroundColor(.black)
                                Spacer()
                                if let data = data, let uiimage = UIImage(data: data) {
                                    Image(uiImage: uiimage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 32, height: 32)
                                }
                                Image(systemName: "camera")
                            }
                    }
                        .onChange(of: selectedItems) { newValue in
                            guard let item = selectedItems.first else { return }
                            item.loadTransferable(type: Data.self) { result in
                                switch result {
                                case .success(let data):
                                    if let data = data {
                                        self.data = data
                                        DispatchQueue.main.async {
                                            addProductVM.productImage = UIImage(data: data)!
                                        }
                                    } else {
                                        print("Data is nil")
                                    }
                                case .failure(let error):
                                    fatalError(error.localizedDescription)
                                }
                            }
                        }
                    }
                }
                
                // ADICIONAR PRODUTO
                Button {
                    store.addProduct(addProductVM.newProduct())
                    presentationMode.wrappedValue.dismiss()
                    print(store.productsList)
                } label: {
                    HStack {
                        Spacer()
                        Text("Adicionar Produto")
                        Spacer()
                    }
                }
                .disabled(!addProductVM.isValid())
            }
        }
        // NAVIGATION VIEW
        .navigationTitle("Adicionar Produto")
        .toolbar {
            Text("Cancelar")
                .foregroundColor(.blue)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .embedInNavigationView()
    }
}

struct AddProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddProductScreen()
            .environmentObject(Store())
    }
}
