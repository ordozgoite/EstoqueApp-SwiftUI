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
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    
    
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
                
                Section("IMAGEM") {
                    HStack {
                        Text("Adicionar Imagem")
                        Spacer()
                        if let image = addProductVM.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                        }
                        
                        // CAMERA BUTTON
                        Button {
                            showSheet = true
                        } label: {
                            Image(systemName: "camera")
                        }
                        .confirmationDialog("Select Photo", isPresented: $showSheet) {
                            Button("Photo Library") {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            }
                            Button("Camera") {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            }
                            Button("Cancel", role: .cancel, action: {})
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
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(image: $addProductVM.image, isShown: $showImagePicker, sourceType: self.sourceType)
        })
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
