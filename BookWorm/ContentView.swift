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
  //@Query(sort: \Book.title) var books: [Book]
  //@Query(sort: \Book.rating, order: .reverse) var books: [Book]
  @Query(sort: [
    SortDescriptor(\Book.title),
    SortDescriptor(\Book.author),
  ]) var books: [Book]

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
        .onDelete(perform: deleteBooks)
      }
        .navigationTitle("Bookworm")
        .navigationDestination(for: Book.self) { book in
        DetailView(book: book)
        }
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            EditButton()
          }
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
  func deleteBooks(at offset: IndexSet) {
    for offset in offset {
      let book = books[offset]
      modelContext.delete(book)
    }
  }
}

#Preview {
  let preview = Preview(Book.self)
  preview.addExamples(Book.sampleBooks)
    return ContentView()
    .modelContainer(preview.container)
}
