//
//  DetailView.swift
//  BookWorm
//
//  Created by Tim Mitra on 2023-11-30.
//

import SwiftUI
import SwiftData

struct DetailView: View {
  let book: Book
  
    var body: some View {
      ScrollView {
        ZStack(alignment: .bottomTrailing) {
          Image(book.genre)
            .resizable()
            .scaledToFit()
          Text(book.genre.uppercased())
            .fontWeight(.black)
            .padding(8)
            .foregroundStyle(.white)
            .background(.black.opacity(0.75))
            .clipShape(.capsule)
            .offset(x: -5, y: -5)
        }
        Text(book.author)
          .font(.title)
          .foregroundStyle(.secondary)
        Text(book.review)
          .padding()
        RatingView(rating: .constant(book.rating))
          .font(.largeTitle)
        
      }
      .navigationTitle(book.title)
      .navigationBarTitleDisplayMode(.inline)
      .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Book.self, configurations: config)
    let example = Book(title: "QBVII", author: "Leon Uris", genre: "Thriller", review: "great book. I enjoyed it", rating: 4)
    
    return DetailView(book: example)
      .modelContainer(container)
  } catch {
    return Text("Failed to create preview: \(error.localizedDescription)")
  }
}
