//
//  WorkoutsView.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/25/22.
//

import SwiftUI

struct WorkoutsView: View {
    
    @StateObject private var workouts: Workouts = Workouts()
    
    @State private var showingAddWorkout = false
    
    var body: some View {
        NavigationView {
            Form {
                if workouts.workouts.count == 0 {
                    Text("No workouts entered.")
                }
                else {
                    List {
                        ForEach(workouts.workouts) { workout in
                            NavigationLink(destination: WorkoutDetailsView(workout: workout, sets: workout.sets)){
                                Text(workout.name)
                            }
                        }
                        .onDelete(perform: deleteWorkout)
                    }
                }
            }
            .navigationTitle("Workouts")
            .toolbar {
                Button {
                    showingAddWorkout = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddWorkout){
                AddWorkoutView(workouts: workouts)
            }
        }
    }
    
    func deleteWorkout(at offsets: IndexSet) {
        workouts.workouts.remove(atOffsets: offsets)
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    
    static var previews: some View {
        WorkoutsView()
    }
}
