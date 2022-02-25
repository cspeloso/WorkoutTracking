//
//  Routine.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/25/22.
//

import Foundation
import Combine

class Routines: ObservableObject {
    @Published var routines = [Routine]()
    
    init() {
//        routines = []
//        routines = [Routine(name: "Day 1", workouts: [Workout(name: "Chin Ups", sets: [Set(reps: 15, weight: 55)])])]
        routines = [Routine(name: "Day 1", workouts: [Workout(name: "Ass", sets: [])])]

    }
}

class Routine: Identifiable, ObservableObject {
    
    var id = UUID()
    
    @Published var name: String
    
    @Published var workouts: Workouts
    
    init(name: String, workouts: [Workout]) {
        self.name = name
        self.workouts = Workouts()
        self.workouts.workouts = workouts
    }
    
}
