//
//  AnimalDetailsView.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import SwiftUI

struct AnimalDetailsView: View {
    
    //MARK: PROPERTIES
    let animal:Animal
    //MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {

            VStack(alignment: .center, spacing: 20) {
                //HEADER IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                //TITLE
                Text(animal.name.uppercased())
                    .underline(true, color: Color.accentColor)
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding(.vertical , 8)
                //HEADLINE
                Text(animal.headline)
                    .foregroundColor(.accentColor)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                //GALLAEY
                Group{
                    HeadingView()
                    GallaryListView(animal: animal)
                }
                .padding(.horizontal)
                //Facts
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you hnow ?")
                    FactsView(animal: animal)
                }
                .padding(.horizontal)
                //DESCRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                //Map
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    AfricaMapView()
                }
                .padding(.horizontal)
                //Link
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                
            }//: VStack
        }//: Scroll
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}
//MARK: PREVIEW
struct AnimalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let animals:[Animal] = Bundle.main.decode("animals.json")
        NavigationView{
            AnimalDetailsView(animal: animals.first!)
                .preferredColorScheme(.dark)
        }
        .previewDevice("iPhone 12 Pro")
    }
}
