//
//  CoverImageView.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: PROPERTIES
    
    private let coverImages:[Cover] = Bundle.main.decode("covers.json")
    
    //MARK: BODY
    var body: some View {
        TabView {
            ForEach(self.coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}
//MARK: PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
            
    }
}
