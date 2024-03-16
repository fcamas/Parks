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

}
