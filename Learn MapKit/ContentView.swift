//
//  ContentView.swift
//  Learn MapKit
//
//  Created by Shaurya Gupta on 2023-01-30.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    // 43.64264381929715, -79.38708898894821 (CN Tower)
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.64264381929715, longitude: -79.38708898894821), span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    
    let locations = [
        Location(name: "CN Tower", coordinate: CLLocationCoordinate2D(latitude: 43.64264381929715, longitude: -79.38708898894821)),
        Location(name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 40.748443, longitude: -73.985650)),
        Location(name: "Statue Of Liberty", coordinate: CLLocationCoordinate2D(latitude: 40.689202, longitude: -74.044543))
    ]
    
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapMarker(coordinate: location.coordinate, tint: .accentColor)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
