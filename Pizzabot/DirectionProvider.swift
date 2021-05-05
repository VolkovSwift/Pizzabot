//
//  DirectionProvider.swift
//  Pizzabot
//
//  Created by Uladzislau Volkau on 5/5/21.
//

import Foundation

protocol DirectionProviderProtocol {
    func convertConsoleInput(input: String?) -> (grid: Grid, points: [Point])?
    func createGrid(from numbers: [Int]) -> Grid?
    func createPoints(from numbers: [Int]) -> [Point]?
    func generateDirections(from points: [Point]) -> String
    func getOverallDirections(startPoint: Point, endPoint: Point) -> String
    func isPointsFitGrid(grid: Grid, points: [Point]) -> Bool
    func convertToIntArray(string: String) -> [Int]?
}

final class DirectionProvider: DirectionProviderProtocol {
    //MARK: - Methods
    
    func convertConsoleInput(input: String?) -> (grid: Grid, points: [Point])? {
        guard let input = input else {
            return nil
        }
        
        let split = input.split(separator: " ", maxSplits: 1)
        
        if split.count == 2,
           let gridNumbers = convertToIntArray(string: String(split[0])),
           let pointNumbers = convertToIntArray(string: String(split[1])),
           let grid = createGrid(from: gridNumbers),
           let points = createPoints(from: pointNumbers) {
            return (grid, points)
        } else {
            return nil
        }
    }
    
    func createGrid(from numbers: [Int]) -> Grid? {
        guard let width = numbers[safe: 0],
              let height = numbers[safe: 1] else { return nil }
              
        return Grid(width: width, height: height)
    }
    
    func createPoints(from numbers: [Int]) -> [Point]? {
        var points = [Point]()
        
        stride(from: 0, to: numbers.count, by: 2).forEach {
            guard let x = numbers[safe: $0],
                  let y = numbers[safe: $0 + 1] else { return }
            
            let point = Point(x: x, y: y)
            points.append(point)
        }
        
        return !points.isEmpty ? points : nil
    }
    
    func generateDirections(from points: [Point]) -> String {
        var result: String = ""
        
        var copyPoints = points
        var prevPoint = Point(x: 0, y: 0)
        
        points.forEach { point in
            let directionsForPoint = getOverallDirections(startPoint: prevPoint, endPoint: point) + Direction.drop
            prevPoint = point
            copyPoints.removeFirst()
            result.append(directionsForPoint)
        }
        
        return result
    }
    
    func getOverallDirections(startPoint: Point, endPoint: Point) -> String {
        let xDirections = getXDirections(startPoint: startPoint.x, endPoint: endPoint.x)
        let yDirections = getYDirections(startPoint: startPoint.y, endPoint: endPoint.y)
        
        return xDirections + yDirections
    }

    func isPointsFitGrid(grid: Grid, points: [Point]) -> Bool {
        var correctPoints: [Point] = []
        
        points.forEach { point in
            if point.x <= grid.height && point.y <= grid.width {
                correctPoints.append(point)
            }
        }
        return points.count == correctPoints.count
    }
    
    func convertToIntArray(string: String) -> [Int]? {
        let stringArray = string.components(separatedBy: CharacterSet.decimalDigits.inverted)
        let resultArray = stringArray.compactMap { Int($0) }
        return !resultArray.isEmpty ? resultArray : nil
    }
    
    //MARK: - Private Methods
    
    private func getXDirections(startPoint: Int, endPoint: Int) -> String {
        let diff = endPoint - startPoint
        
        if diff > 0 {
            return String(repeating: Direction.east, count: diff)
        } else {
            return String(repeating: Direction.west, count: abs(diff))
        }
    }
    
    private func getYDirections(startPoint: Int, endPoint: Int) -> String {
        let diff = endPoint - startPoint
        
        if diff > 0 {
            return String(repeating: Direction.north, count: diff)
        } else {
            return String(repeating: Direction.south, count: abs(diff))
        }
    }
}
