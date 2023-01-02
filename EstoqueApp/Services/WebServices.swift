//
//  WebServices.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 02/01/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class WebServices {
    
    static var shared = WebServices()
    
//    FirebaseApp.configure()

    let db = Firestore.firestore()
    
    func addProduct() {
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
