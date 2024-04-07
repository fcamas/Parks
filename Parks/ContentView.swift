//
//  ContentView.swift
//  Parks
//
//  Created by Fredy Camas on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var parks: [Park] = []

    var body: some View {
        Text("Hello")
        
    }
    private func fetchParks() async{
        
        // Do something when the view appears
        print("On appear...")
        
        // URL for the API endpoint
        // 👋👋👋 Make sure to replace {YOUR_API_KEY} in the URL with your actual NPS API Key
        // Pass in any state code you like for the stateCode parameter. For instance, stateCode=fl (Florida state)
        guard let apiKey = ProcessInfo.processInfo.environment["NPS_API_KEY"] else {
            fatalError("API key not found in environment variables.")
        }
        let url = URL(string: "https://developer.nps.gov/api/v1/parks?stateCode=wa&api_key=\(apiKey)")!
        do {
            
            // Perform an asynchronous data request
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode json data into ParksResponse type
            let parksResponse = try JSONDecoder().decode(ParksResponse.self, from: data)
            
            // Get the array of parks from the response
            let parks = parksResponse.data
            
            // Print the full name of each park in the array
            for park in parks {
                print(park.fullName)
            }
            
            // TODO: Set the parks state property
           
            self.parks = parks
            
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
}

#Preview {
    ContentView()
}


