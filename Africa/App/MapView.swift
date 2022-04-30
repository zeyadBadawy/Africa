//
//  MapView.swift
//  Africa
//
//  Created by Zeyad Badawy on 22/04/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    //MARK: BODY
    var body: some View {
        //Basic map
        // Map(coordinateRegion: $region)
        
        //Advanced map
        ZStack {
            Map(coordinateRegion: $region, annotationItems:locations) { item in
                //1:MapPin
                //            MapPin(coordinate: item.location, tint: .accentColor)
                
                //2:MapMarker
                //            MapMarker(coordinate: item.location, tint: .accentColor)
                
                //3:MapAnnotation
                MapAnnotation(coordinate: item.location) {
                    AfricaMapAnnotation(location: item)
                }
            }
            
            VStack {
                GroupBox {
                    HStack {
                        Image("compass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48, alignment: .center)
                        
                        VStack {
                            HStack{
                                Text("Latitude")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                Spacer()
                                Text("\(region.center.latitude)")
                                    .font(.footnote)
                            }//: HStack
                            Divider()
                            HStack{
                                Text("Longitude")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                                Spacer()
                                Text("\(region.center.longitude)")
                                    .font(.footnote)
                            }//: HStack
                        }//: VStack
                    }
                }//: Box
                .padding()
                Spacer()
            }//: VStack
            .padding(.vertical , 12)
            
        }//: Map
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
