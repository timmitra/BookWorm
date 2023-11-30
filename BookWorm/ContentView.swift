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
      }
    }
}

#Preview {
    ContentView()
}
