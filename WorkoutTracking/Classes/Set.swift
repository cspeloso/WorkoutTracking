//
//  Set.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/24/22.
//

import Foundation

class Sets: ObservableObject {
    
    @Published var sets = [Set]()
    
    init() {
        sets = []
    }
}

class Set: Identifiable, ObservableObject {
    
    var id = UUID()
    
    @Published var reps: Int
    
    @Published var weight: Double
    
    init(reps: Int, weight: Double) {
        self.reps = reps
        self.weight = weight
    }
    
}
