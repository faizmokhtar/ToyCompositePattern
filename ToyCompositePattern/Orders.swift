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
  let parts: [CarPart]

  init(customer: String, parts: [CarPart]) {
    self.customer = customer
    self.parts = parts
  }

  var totalPrice: Float {
    return parts.reduce(0, { subtotal, part in
      return subtotal + part.price
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
