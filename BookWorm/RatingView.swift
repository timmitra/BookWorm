//
//  RatingView.swift
//  BookWorm
//
//  Created by Tim Mitra on 2023-11-30.
//

import SwiftUI

struct RatingView: View {
  @Binding var rating: Int
  
  var label = ""
  var maximumRating = 5
  
  var offImage: Image?
  var onImage = Image(systemName: "star.fill")
  
  var offColor = Color.gray
  var onColor = Color.yellow
  
  
    var body: some View {
      HStack {
        if label.isEmpty == false {
          Text(label)
        }
        ForEach(1..<maximumRating + 1, id: \.self) { number in
          Button {
            rating = number
          } label: {
            image(for: number)
              .foregroundColor(number > rating ? offColor : onColor) 
          }
        }
      }
      .buttonStyle(.plain) // this fixes the all button thing.
    }
  
  func image(for number: Int) -> Image {
    if number > rating {
      offImage ?? onImage
    } else {
      onImage
    }
  }
}

#Preview {
  RatingView(rating: .constant(4))
}
