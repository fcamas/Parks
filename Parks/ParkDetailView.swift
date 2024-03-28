//
//  ParkDetailView.swift
//  Parks
//
//  Created by Fredy Camas on 4/1/24.
//

import SwiftUI
import MapKit

struct ParkDetailView: View {
    
    let park: Park // <-- park property to allow for passing in a park when the detail is presented
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) { // Aligns vertical views to the leading edge with 16pt spacing between views
                Text(park.fullName)
                    .font(.largeTitle)
                Text(park.description)
                Rectangle()
                    .aspectRatio(7/5, contentMode: .fit) // <-- Set aspect ratio 7:5
                    .containerRelativeFrame(.horizontal, count: 9, span: 8, spacing: 16) // <-- Size the views relative to the container (spacing matches HStack spacing)
                    .overlay {
                        AsyncImage(url: URL(string: image.url)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color(.systemGray4)
                        }
                    }
            }
            .padding()
        }
    }
}

extension Park {
    static var mocked: Park {
        let jsonUrl = Bundle.main.url(forResource: "park_mock", withExtension: "json")!
        let data = try! Data(contentsOf: jsonUrl)
        let park = try! JSONDecoder().decode(Park.self, from: data)
        return park
    }
}
