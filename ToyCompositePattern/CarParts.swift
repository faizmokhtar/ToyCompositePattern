//
//  CarParts.swift
//  ToyCompositePattern
//
//  Created by Faiz Mokhtar on 15/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

protocol CarPart {
  var name: String { get }
  var price: Float { get }
}

class Part: CarPart {
  let name: String
  let price: Float

  init(name: String, price: Float) {
    self.name = name
    self.price = price
  }
}

class CompositePart: CarPart {
  let name: String
  let parts: [CarPart]

  init(name: String, parts: CarPart...) {
    self.name = name
    self.parts = parts
  }

  var price: Float {
    return parts.reduce(0, { subtotal, part in
      return subtotal + part.price
    })
  }
}
