//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Zeyad Badawy on 30/04/2022.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: PROPERTIES
    let animal:Animal
    
    
    //MARK: BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}
//MARK: PREVIEW
struct AnimalGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        let animals:[Animal] = Bundle.main.decode("animals.json")
        AnimalGridItemView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
