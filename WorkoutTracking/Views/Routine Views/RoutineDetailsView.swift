//
//  RoutineDetailsView.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/25/22.
//

import SwiftUI

struct RoutineDetailsView: View {
    
    @ObservedObject var routine: Routine
    
    @StateObject var workouts: Workouts
    
    @State private var showingWorkoutsView = false
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $routine.name)
            } header: {
                Text("Routine Name")
            }
            
            Section {
                if routine.workouts.workouts.count == 0 {
                    Text("No workouts found.")
                }
                else {
                    ForEach(self.routine.workouts.workouts) { workout in
                        NavigationLink(destination: WorkoutDetailsView(workout: workout, sets: workout.sets)){
                            Text(workout.name)
                        }
                    }
                    .onDelete(perform: deleteWorkout)
                }
            } header: {
                Text("Workouts")
            }
        }
        .navigationTitle("Routine Details")
        .toolbar {
            Button("Add workout"){
                showingWorkoutsView = true
            }
        }
        .sheet(isPresented: $showingWorkoutsView){
            AddWorkoutView(workouts: routine.workouts)
        }
    }
    
    func deleteWorkout(at offsets: IndexSet){
        routine.workouts.workouts.remove(atOffsets: offsets)
    }
}

struct RoutineDetailsView_Previews: PreviewProvider {
    
    static var work = Workout(name: "test", sets: [])
    
//    static let routine: Routine = Routine(name: "Routine 1", workouts: [Workout(name: "Chin Ups", sets: [Set(reps: 15, weight: 55)])])
    
    static var routine = Routine(name: "test", workouts: [work])

    static var previews: some View {
        RoutineDetailsView(routine: routine, workouts: routine.workouts)
    }
}
