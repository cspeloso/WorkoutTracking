//
//  Workout.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/24/22.
//

import Foundation


class Workouts: ObservableObject {
    
    @Published var workouts = [Workout]()
    
    init() {
        workouts = []
    }
    init(workout: Workout){
        workouts.append(workout)
    }
    
}

class Workout: Identifiable, ObservableObject {
    
    var id = UUID()
    
    @Published var name: String
    
    @Published var sets: Sets
    
    init(name: String, sets: [Set]) {
        self.name = name
        self.sets = Sets()
        self.sets.sets = sets
    }
    
}
