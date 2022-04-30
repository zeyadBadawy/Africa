//
//  AfricaMapView.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import SwiftUI
import MapKit

struct AfricaMapView: View {
    
    // MARK: - PROPERTIES
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))

    // MARK: - BODY

    
    var body: some View {
        ZStack (alignment: .topTrailing){
            Map(coordinateRegion: $region)
                .frame(height:256)
            .cornerRadius(12)
            GroupBox {
                HStack {
                    NavigationLink {
                        MapView()
                    } label: {
                        Image(systemName: "mappin.circle")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: NavLink
                }//: HStack
                
            }//: Groupbox
            .groupBoxStyle(TransparentGroupBox())
            .padding(8)
            
        }//: ZStack
    }
}

struct AfricaMapView_Previews: PreviewProvider {
    static var previews: some View {
        AfricaMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.black.opacity(0.4)))
            .overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
    }
}
