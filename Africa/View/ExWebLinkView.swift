//
//  ExWebLinkView.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import SwiftUI

struct ExWebLinkView: View {
    //MARK: PROPERTIES
    var animal:Animal
    //MARK: BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                HStack{
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(destination:  URL(string: animal.link) ?? URL(string: "https://google.com")!) {
                        Text(animal.name)
                    }
                }
            }
        }
    }
}

struct ExWebLinkView_Previews: PreviewProvider {
    static var previews: some View {
        let animals:[Animal] = Bundle.main.decode("animals.json")
        ExWebLinkView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
