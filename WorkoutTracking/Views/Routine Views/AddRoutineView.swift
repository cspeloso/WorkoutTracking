//
//  AddRoutineView.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/25/22.
//

import SwiftUI

struct AddRoutineView: View {
    
    @ObservedObject var routines: Routines
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                } header: {
                    Text("Name")
                }
            }
            .navigationTitle("Create new routine")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    Button("Save"){
                        let routine: Routine = Routine(name: name, workouts: [])
                        routines.routines.append(routine)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddRoutineView_Previews: PreviewProvider {
    
    static let routines = Routines()
    
    static var previews: some View {
        AddRoutineView(routines: routines)
    }
}
