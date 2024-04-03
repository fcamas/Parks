//
//  ParkView.swift
//  Parks
//
//  Created by Fredy Camas on 4/3/24.
//

import SwiftUI

struct ParkRow: View {
    let park: Park
    var body: some View {
        Rectangle()
            .aspectRatio(4/3, contentMode: .fit)
            .overlay {
                // TODO: Get image url
                let image = park.images.first
                let urlString = image?.url
                let url = urlString.flatMap { string in
                    URL(string: string)
                }
                
                // TODO: Add AsyncImage
                AsyncImage(url: url) { image in
                    image // <-- The fetched image
                        .resizable() // <-- This allows the image to be resized
                        .aspectRatio(contentMode: .fill) // <-- Tells the image to size to fill the available space
                } placeholder: {
                    Color(.systemGray4) // <-- A gray color to use as a placeholder while the image is loading
                }
            }
        
            .overlay(alignment: .bottomLeading){
                Text(park.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                
            }.cornerRadius(16)
            .padding(.horizontal)
    }
}



#Preview {
    ParkRow(park: Park.mocked)
}


