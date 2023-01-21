//
//  ContentView.swift
//  Map
//
//  Created by HEMANTH on 21/01/23.
//

import SwiftUI
import MapKit


struct Location :Identifiable{
    
    let id = UUID()
    let name:String
    let coordinate : CLLocationCoordinate2D
    
}
struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)){
        didSet{
            print(mapRegion.center.latitude)
        }
    }
    
    let locations =  [
        Location(name: "Buckingham", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141))
    ]
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $mapRegion , annotationItems :  locations ){ location in
//                MapMarker(coordinate: location.coordinate)
                MapAnnotation(coordinate: location.coordinate,  content: {
                    VStack{
                    Circle()
                        .stroke(.red, lineWidth: 3.0)
                        .frame(width: 50,height: 50)
                        
                        Text(location.name).foregroundColor(.red).font(.title).fontWeight(.bold)
                    }
                })
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
