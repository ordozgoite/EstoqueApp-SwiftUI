//
//  View+Extensions.swift
//  EstoqueApp
//
//  Created by Victor Ordozgoite on 29/12/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
