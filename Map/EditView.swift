//
//  EditView.swift
//  Map
//
//  Created by HEMANTH on 22/01/23.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) private var dismiss
    
    var location :NewLocation
    
    @State private var name:String
    @State private var description:String
    private var  onSave : (NewLocation)->Void
    
    init(location: NewLocation , onSave :@escaping (NewLocation)->Void) {
        
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    var body: some View {
        NavigationView(content: {
            Form{
                Section(content: {
                    TextField("Place Name", text: $name)
                    TextField("Description", text: $description)
                })
            }
            .navigationTitle("Place detail")
            .toolbar(content: {
                Button("save"){
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
            })
        })
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location : NewLocation(name: "", description: "", longitude: 0.0, latitude: 0.0)){ _ in
            
        }
    }
}
