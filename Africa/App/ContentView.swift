//
//  ContentView.swift
//  Africa
//
//  Created by Zeyad Badawy on 22/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTIES
    private let animals:[Animal] = Bundle.main.decode("animals.json")
    @State var selection: Int?
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive = false
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //: MARK - FUNCTIONS
    
    func gridSwitch() {
      gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
      gridColumn = gridLayout.count
      print("Grid Number: \(gridColumn)")
      
      // TOOLBAR IMAGE
      switch gridColumn {
      case 1:
        toolbarIcon = "square.grid.2x2"
      case 2:
        toolbarIcon = "square.grid.3x2"
      case 3:
        toolbarIcon = "rectangle.grid.1x2"
      default:
        toolbarIcon = "square.grid.2x2"
      }
    }
    
    //MARK: BODY
    var body: some View {
        NavigationView{
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height:300)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { item in
                            NavigationLink {
                                AnimalDetailsView(animal: item)
                            } label: {
                                AnimalListItemView(animal: item)
                            }
                        }//: Loop
                        
                        CreditsView()
                            .modifier(CenterModifier())
                        
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false ) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { item in
                                NavigationLink {
                                    AnimalDetailsView(animal: item)
                                } label: {
                                    AnimalGridItemView(animal: item)
                                }//: Navigation Link
                            }//: Loop
                        }//: VGrid
                        .padding()
                        .animation(.easeIn)
                    }//: Scroll
                }//: Condition
            }//: Group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing:16){
                        Button {
                            print("list button tapped")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }//: List
                        
                        Button {
                            print("grid view ")
                            gridSwitch()
                            isGridViewActive = true
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName:toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }//: Grid

                    }//: HStack
                }
            }
            
        }//: Navigation
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}
//MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
