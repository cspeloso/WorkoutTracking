//
//  WorkoutDetailsView.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/25/22.
//

import SwiftUI

struct WorkoutDetailsView: View {
    
    @ObservedObject var workout: Workout
    
    @StateObject var sets: Sets
    
    var body: some View {
        Form {
            Section {
                
                Text(workout.name)
                
            } header: {
                
                Text("Name")
                
            }
            Section {
                List {
                    ForEach(workout.sets.sets) { set in
                        Text("\(set.reps) reps @ \(set.weight.formatted()) lbs")
                    }
                    .onDelete(perform: deleteSet)
                }
            } header: {
                
                Text("Sets")
                
            }
        }
        .navigationTitle(workout.name)
    }
    
    func deleteSet(at offsets: IndexSet){
        sets.sets.remove(atOffsets: offsets)
    }
}

struct WorkoutDetailsView_Previews: PreviewProvider {
    
    static let workout: Workout = Workout(name: "Chin Ups", sets: [Set(reps: 15, weight: 55), Set(reps: 15, weight: 55), Set(reps: 15, weight: 55)])
    
    static var previews: some View {
        WorkoutDetailsView(workout: workout, sets: workout.sets)
    }
}
