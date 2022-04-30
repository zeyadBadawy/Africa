//
//  CenterModifier.swift
//  Africa
//
//  Created by Zeyad Badawy on 30/04/2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
    
    
}
