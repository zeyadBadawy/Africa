//
//  GalleryView.swift
//  Africa
//
//  Created by Zeyad Badawy on 22/04/2022.
//

import SwiftUI

struct GalleryView: View {
    //MARK: PROPERTIES
    
    
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .heavy)
    @State private var selectedAnimal = "lion"
    
//    var gridLayout:[GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
//    var gridLayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var numberOfColumns:Double = 3.0
    
    //MARK: FUNCTIONS
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(numberOfColumns))
        haptics.impactOccurred()
    }
    
    //MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            //MARK: GRID
            VStack(alignment: .center, spacing: 30) {
                ZStack {
                    Circle()
                        .stroke(Color.white , lineWidth: 8)
                    Image(selectedAnimal)
                        .resizable()
                        .scaledToFit()
                        .frame(height:200)
                    .clipShape(Circle())
                }//: ZStack
               
                //MARK: Slider
                
                Slider(value: $numberOfColumns , in: 2...4 , step: 1)
                    .padding(.horizontal)
                    .onChange(of: numberOfColumns) { newValue in
                        gridSwitch()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        ZStack{
                            Circle()
                                .stroke(Color.white , lineWidth: 1)
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .onTapGesture {
                                    selectedAnimal = item.image
                                    haptics.impactOccurred()
                                }
                        }//: ZStack
                    }//: Loop
                }//: VGrid
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }//: VStack
            .padding(.horizontal , 10)
            .padding(.vertical , 50)
        }//: Scroll
        .frame(maxWidth:.infinity , maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
