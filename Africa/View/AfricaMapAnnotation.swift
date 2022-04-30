//
//  AfricaMapAnnotation.swift
//  Africa
//
//  Created by Zeyad Badawy on 24/04/2022.
//

import SwiftUI
import MapKit

struct AfricaMapAnnotation: View {
    
    //MARK: PROPERTIES
    var location:Location
    @State private var animation:CGFloat = 0.0
    
    //MARK: BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor , lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + animation)
                .opacity(1 - Double(animation))
            
            Image(location.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }//: ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 1.5).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct AfricaMapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        let locations:[Location] = Bundle.main.decode("locations.json")
        AfricaMapAnnotation(location: locations.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
