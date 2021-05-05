//
//  DirectionsBuilder.swift
//  Pizzabot
//
//  Created by Uladzislau Volkau on 5/5/21.
//

import Foundation

protocol DirectionsBuilderProtocol {
    func generateDirections(input: String?) -> String
}

final class DirectionsBuilder: DirectionsBuilderProtocol {
    //MARK: - Properties
    
    let directionProvider: DirectionProviderProtocol
    let console: ConsoleProviderProtocol
    
    //MARK: - Init
    
    init(directionProvider: DirectionProviderProtocol = DirectionProvider(), console: ConsoleProviderProtocol = ConsoleProvider()) {
        self.directionProvider = directionProvider
        self.console = console
    }
    
    //MARK: - Methods
    
    func generateDirections(input: String?) -> String {
        guard let input = input, !input.isEmpty else {
            return console.printMessage(ErrorMessage.emptyInput, type: .error)
        }
        
        guard let convertedInput = directionProvider.convertConsoleInput(input: input) else {
            return console.printMessage(ErrorMessage.invalidFormat, type: .error)
        }
        
        if !directionProvider.isPointsFitGrid(grid: convertedInput.grid, points: convertedInput.points) {
            return console.printMessage(ErrorMessage.pointGreaterThanGrid, type: .error)
        } else {
            let direction = directionProvider.generateDirections(from: convertedInput.points)
            return console.printMessage(direction, type: .standard)
        }
    }
}

