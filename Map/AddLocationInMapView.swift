//
//  AddLocationInMapView.swift
//  Map
//
//  Created by HEMANTH on 21/01/23.
//

import SwiftUI
import MapKit


struct AddLocationInMapView: View {
    
    @StateObject var viewModel = MapDemoViewModel()
    
    var body: some View {
        if viewModel.isUnlocked{
            ZStack{
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems :  viewModel.locations ){ location in
                    MapAnnotation(coordinate: location.coordinate){
                        VStack{
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width:45 , height: 45)
                                .background(.white.opacity(0.75))
                                .clipShape(Circle())
                                .onTapGesture(perform: {
                                    viewModel.selectedLocation = location
                                })
                            Text(location.name)
                            Text(location.description)
                        }
                    }
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
                            
                            viewModel.addLocation()
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
                
            }
            .ignoresSafeArea()
            .sheet(item: $viewModel.selectedLocation){ place in
                EditView(location: place){ location in
                    viewModel.update(location: location)
                }
                
            }
        }else {
            Button("unlock places App"){
                viewModel.athenticate()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
    
}

struct AddLocationInMapView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationInMapView()
    }
}
