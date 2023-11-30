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
  @Query(sort: \Book.title) var books: [Book]
  
  @State private var showingAddScreen = false
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(books) { book in
          NavigationLink(value: book) {
            HStack {
              EmojiRatingView(rating: book.rating)
                .font(.largeTitle)
              VStack(alignment: .leading) {
                Text(book.title)
                  .font(.headline)
                Text(book.author)
                  .foregroundStyle(.secondary)
              }
            }
          }
        }
      }
        .navigationTitle("Bookworm")
        .navigationDestination(for: Book.self) { book in
        DetailView(book: book)
        }
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button("Add Book", systemImage: "plus") {
              showingAddScreen.toggle()
            }
          }
        }
        .sheet(isPresented: $showingAddScreen) {
          AddBookView()
        }
    }
  }
}

#Preview {
  let preview = Preview(Book.self)
  preview.addExamples(Book.sampleBooks)
    return ContentView()
    .modelContainer(preview.container)
}
