//
//  RoutineView.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/25/22.
//

import SwiftUI

struct RoutineView: View {
    
    @StateObject var routines = Routines()
    
    @State private var showingAddRoutine = false
    
    var body: some View {
        NavigationView {
            Form {
                if routines.routines.count == 0 {
                    Text("No routines created yet.")
                }
                else {
                    ForEach(routines.routines) { routine in
                        NavigationLink(destination: RoutineDetailsView(routine: routine, workouts: routine.workouts)){
                            Text(routine.name)
                        }
                    }
                    .onDelete(perform: deleteRoutine)
                }
            }
            .navigationTitle("Routines")
            .toolbar {
                Button {
                    showingAddRoutine = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddRoutine){
                AddRoutineView(routines: routines)
            }
        }
    }
    
    func deleteRoutine(at offsets: IndexSet){
        routines.routines.remove(atOffsets: offsets)
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView()
    }
}
