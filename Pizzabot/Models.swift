//
//  Models.swift
//  Pizzabot
//
//  Created by Uladzislau Volkau on 5/5/21.
//

import Foundation

//MARK: - Enums

enum ErrorMessage {
    static let emptyInput = "Input can't be empty"
    static let invalidFormat = "Invalid string format"
    static let pointGreaterThanGrid = "Sorry, Point can't be greater than Grid size"
}

enum Direction {
    static let north = "N"
    static let south = "S"
    static let east = "E"
    static let west = "W"
    static let drop = "D"
}

enum Axis {
    case xAxis
    case yAxis
}

//MARK: - Structs

struct Grid: Equatable {
    let width: Int
    let height: Int
}

struct Point: Equatable {
    let x: Int
    let y: Int
}


