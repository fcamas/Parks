//
//  ParkResponse .swift
//  Parks
//
//  Created by Fredy Camas on 4/1/24.
//

import Foundation


struct ParksResponse: Codable {
    let data: [Park]
}

struct Park: Codable, Identifiable , Hashable, Equatable{
    let id: String
    let fullName: String
    let description: String
    let longitude: String
    let images: [ParkImage]
    let name: String
    
    func hash(into hasher: inout Hasher) { // <-- Add required hash function
         hasher.combine(id)
     }
}

struct ParkImage: Codable, Identifiable, Equatable {
    let title: String
    let caption: String
    let url: String
    
    var id: String { // <-- Add id property to conform to Identifiable
            return url // <-- Use the url string as t he id since it will be unique for a given image
        }
}
