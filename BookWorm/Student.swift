//
//  Student.swift
//  BookWorm
//
//  Created by Tim Mitra on 2023-11-30.
//

import Foundation
import SwiftData

@Model
class Student {
  var id: UUID
  var name: String
  
  init(id: UUID, name: String) {
    self.id = id
    self.name = name
  }
}
