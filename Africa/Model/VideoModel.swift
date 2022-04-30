//
//  VideoModel.swift
//  Africa
//
//  Created by Zeyad Badawy on 24/04/2022.
//

import Foundation

struct Video: Codable , Identifiable {
    let id : String
    let name : String
    let headline : String
    
    var thumbnail:String {
        "video-\(id)"
    }
}
