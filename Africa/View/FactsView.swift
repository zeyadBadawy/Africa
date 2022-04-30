//
//  FactsView.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import SwiftUI

struct FactsView: View {
    //MARK: PROPERTIES
    var animal:Animal
    //MARK: BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact , id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(.page)
            .frame(height:180)
        }
        
    }
}
//MARK: PREVIEW
struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        let animals:[Animal] = Bundle.main.decode("animals.json")
        FactsView(animal: animals.first!)
            .previewLayout(.fixed(width: 400, height: 300))
            .padding()
    }
}
