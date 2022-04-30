//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import SwiftUI

struct AnimalListItemView: View {
    //MARK: PROPERTIES
    
    var animal:Animal
    
    //MARK: BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .cornerRadius(12)
            VStack(alignment: .leading, spacing: 10) {
                Text(animal.name)
                    .foregroundColor(Color.accentColor)
                    .fontWeight(.bold)
                Text(animal.description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.footnote)
                    .padding(.trailing , 8 )
            }//: VStack
        }//: HStack
    }
}
//MARK: PREVIEW
struct AnimalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let animals:[Animal] = Bundle.main.decode("animals.json")
        AnimalListItemView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
