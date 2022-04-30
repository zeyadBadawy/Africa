//
//  GallaryListView.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import SwiftUI

struct GallaryListView: View {
    //MARK: PROPERIES
    var animal:Animal
    //MARK: BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(animal.gallery , id:\.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height:200)
                    .cornerRadius(12)
                }
            }
        }//: Scroll
        
    }
}
//MARK: PREVIEW
struct GallaryListView_Previews: PreviewProvider {
    static var previews: some View {
        let animals:[Animal] = Bundle.main.decode("animals.json")
        GallaryListView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
