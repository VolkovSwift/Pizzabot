//
//  Extensions.swift
//  Pizzabot
//
//  Created by Uladzislau Volkau on 5/5/21.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
