//
//  CreditsView.swift
//  Africa
//
//  Created by Zeyad Badawy on 30/04/2022.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
        Copyright © Zeyad Badawy
        All right reserved
        Better Apps ♡ Less Code
        """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
