//
//  ContentView.swift
//  BookWorm
//
//  Created by Tim Mitra on 2023-11-30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) var modelContext
  @Query var students: [Student]
  
    var body: some View {
      NavigationStack {
        List(students) { student in
          Text(student.name)
        }
        .navigationTitle("Classroom")
        .toolbar {
          Button("Add") {
            let firstNames = ["Ginny", "Harry", "Hermione", "Ron", "Luna"]
            let lastNames = ["Granger", "Lovegood", "Potter", "Weasly"]
            
            let chosenFirstName = firstNames.randomElement()!
            let chosenLastName = lastNames.randomElement()!
            
            // more to come
            let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
            modelContext.insert(student)
          }
        }
      }
    }
}

#Preview {
    ContentView()
}
