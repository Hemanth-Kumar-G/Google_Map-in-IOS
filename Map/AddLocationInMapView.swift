//
//  AddLocationInMapView.swift
//  Map
//
//  Created by HEMANTH on 21/01/23.
//

import SwiftUI
import MapKit

struct NewLocation :Identifiable{
    let id = UUID()
    let name:String
    let description:String
    let longitude : Double
    let latitude : Double
}

struct AddLocationInMapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State var locations = [NewLocation]()
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $mapRegion, annotationItems :  locations ){ location in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            }
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        
                        locations.append(
                            NewLocation(
                                name: "New Location",
                                description: "",
                                longitude: mapRegion.center.longitude,
                                latitude: mapRegion.center.latitude
                            )
                        )
                    } label: {
                        Image(systemName: "plus")
                    } .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 40.0, trailing: 40.0))
                    
                    
                }
            }
            
        }.ignoresSafeArea()
    }
}

struct AddLocationInMapView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationInMapView()
    }
}
