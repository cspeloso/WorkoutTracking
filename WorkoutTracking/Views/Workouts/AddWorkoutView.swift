//
//  AddWorkoutView.swift
//  WorkoutTracking
//
//  Created by Chris Peloso on 2/24/22.
//

import SwiftUI
import Combine

struct AddWorkoutView: View {
    
    @ObservedObject var workouts: Workouts
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    
    @State private var reps: Int = 0
    @State private var weight: Double = 0.0
    
    @State private var sets: [Set] = []
    

    let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Workout Name", text: $name)
                    }
                    
                    Section {
                        Picker("Reps", selection: $reps) {
                            ForEach(0..<50) {
                                Text("\($0) reps")
                            }
                        }
                        
                        TextField("Weight", value: $weight, formatter: decimalFormatter)
                            .keyboardType(.decimalPad)
                        
                        Button("Add set") {
                            let newSet = Set(reps: reps, weight: weight)
                            sets.append(newSet)
                        }
                    } header: {
                        Text("Add a set")
                    }
                    
                    Section {
                        
                        ForEach(sets) { s in
                            Text("\(s.reps) reps @ \(s.weight.formatted()) lbs")
                        }
                        .onDelete(perform: deleteFromSets)
                        
                    } header: {
                        Text("Sets")
                    }
                }
                .navigationTitle("Add New Workout")
                .toolbar {
                    ToolbarItem (placement: ToolbarItemPlacement.navigationBarLeading) {
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                    ToolbarItem (placement: ToolbarItemPlacement.navigationBarTrailing) {
                        Button("Save") {
                            let workout = Workout(name: name, sets: sets)
                            workouts.workouts.append(workout)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
    
    func deleteFromSets(at offsets: IndexSet){
        sets.remove(atOffsets: offsets)
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkoutView(workouts: Workouts())
    }
}
