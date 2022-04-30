//
//  LocationModel.swift
//  Africa
//
//  Created by Zeyad Badawy on 24/04/2022.
//

import SwiftUI
import MapKit

struct Location:Codable , Identifiable {
    let id : String
    let name :String
    let image :String
    let latitude: Double
    let longitude:Double
    
    var location:CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
