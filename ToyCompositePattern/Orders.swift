//
//  Orders.swift
//  ToyCompositePattern
//
//  Created by Faiz Mokhtar on 15/02/2018.
//  Copyright © 2018 Faiz Mokhtar. All rights reserved.
//

import Foundation

class CustomerOrder {
  let customer: String
  let parts: [Part]
  let compositeParts: [CompositePart]

  init(customer: String, parts: [Part], composites: [CompositePart]) {
    self.customer = customer
    self.parts = parts
    self.compositeParts = composites
  }

  var totalPrice: Float {
    let partReducer = { (subtotal: Float, part: Part) -> Float in
      return subtotal + part.price
    }

    let total = parts.reduce(0, partReducer)

    return compositeParts.reduce(total, { (subtotal, cpart) -> Float in
      return cpart.parts.reduce(subtotal, partReducer)
    })
  }

  func printDetails() {
    print("Order for \(customer): Cost: \(formatCurrencyString(number: totalPrice))")
  }

  func formatCurrencyString(number: Float) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: number)) ?? ""
  }
}
