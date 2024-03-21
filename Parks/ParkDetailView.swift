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
            }
            .padding()
        }
    }
}
