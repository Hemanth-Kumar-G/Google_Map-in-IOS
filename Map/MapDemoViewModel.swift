//
//  MapDemoViewModel.swift
//  Map
//
//  Created by HEMANTH on 22/01/23.
//

import Foundation
import MapKit
import LocalAuthentication

struct NewLocation :Identifiable ,Equatable ,Codable{
    var id = UUID()
    var name:String
    var description:String
    let longitude : Double
    let latitude : Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func ==(lhs :NewLocation ,rhs :NewLocation) -> Bool{
        return lhs.id == rhs.id
    }
}

extension AddLocationInMapView {
    
    @MainActor class MapDemoViewModel : ObservableObject{
        
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)){
            didSet{
                print(mapRegion.center.latitude)
            }
        }
        
        @Published private(set) var  locations :  [NewLocation]
        @Published var selectedLocation: NewLocation?
        
        @Published var isUnlocked = false
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([NewLocation].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            let newLocation = NewLocation(id: UUID(),
                                          name: "New location",
                                          description: "",
                                          longitude:  mapRegion.center.longitude,
                                          latitude: mapRegion.center.latitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: NewLocation) {
            guard let selectedPlace = selectedLocation else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        
        func athenticate(){
            let context = LAContext()
            var error : NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
                let reason = "Please athenticate yourself to unlock your place"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success ,authenticationError in
                    if  success {
                        Task{
                            await MainActor.run{
                                self.isUnlocked = true
                            }
                        }
                    } else {
                        //error
                    }
                }
            }else {
                // no biometric
            }
        }
    }
}
