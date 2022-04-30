//
//  AnimalModel.swift
//  Africa
//
//  Created by Zeyad Badawy on 23/04/2022.
//

import Foundation

// MARK: - AnimalElement
struct Animal:Codable , Identifiable {
    
    let id, name, headline, description: String
    let link: String
    let image: String
    let gallery, fact: [String]
    
}
