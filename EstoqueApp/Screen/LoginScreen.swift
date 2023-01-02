//
//  LoginScreen.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 02/01/23.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct LoginScreen: View {
    
    @ObservedObject private var authVM = AuthenticationViewModel()
    
    var body: some View {
        VStack {
            SignInWithAppleButton { request in
                authVM.handleSignInWithAppleRequest(request)
            } onCompletion: { result in
                authVM.handleSignInWithAppleCompletion(result)
            }
            .frame(width: 260, height: 50)
            .cornerRadius(8)
        }
        .navigationTitle("Sign in")
        .embedInNavigationView()
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
