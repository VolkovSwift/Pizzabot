//
//  main.swift
//  Pizzabot
//
//  Created by Uladzislau Volkau on 5/5/21.
//

import Foundation

let builder = DirectionsBuilder()

let arguments = CommandLine.arguments

if arguments.count < 2 {
        _ = builder.generateDirections(input: nil)
    } else {
        _ = builder.generateDirections(input: arguments[1])
    }

