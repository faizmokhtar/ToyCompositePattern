//
//  CarParts.swift
//  ToyCompositePattern
//
//  Created by Faiz Mokhtar on 15/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

class Part {
  let name: String
  let price: Float

  init(name: String, price: Float) {
    self.name = name
    self.price = price
  }
}

class CompositePart {
  let name: String
  let parts: [Part]

  init(name: String, parts: Part...) {
    self.name = name
    self.parts = parts
  }
}
