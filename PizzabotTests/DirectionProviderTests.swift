//
//  DirectionProviderTests.swift
//  PizzabotTests
//
//  Created by Uladzislau Volkau on 5/5/21.
//

import XCTest

class DirectionProviderTests: XCTestCase {
    var sut: DirectionProvider!
    
    override func setUp() {
        super.setUp()
        sut = DirectionProvider()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testConvertConsoleInput_nilInput() {
        let result = sut.convertConsoleInput(input: nil)
        XCTAssertNil(result)
    }
    
    func testConvertConsoleInput_correctInput() {
        let result = sut.convertConsoleInput(input: "5x5 (4,4) (3,3)")
        XCTAssertEqual(result?.grid, Grid(width: 5, height: 5), "\(result!.grid) doesn't match with \(Grid(width: 5, height: 5))")
        XCTAssertEqual(result?.points.count, 2, "Count\(result!.points.count) should be 2")
    }
    
    func testConvertConsoleInput_incorrectInput() {
        let result = sut.convertConsoleInput(input: "Incorrect input")
        XCTAssertNil(result)
    }
    
    func testCreateGrid_success() {
        let grid = Grid(width: 1, height: 2)
        let result = sut.createGrid(from: [1,2])
        XCTAssertEqual(result, grid, "\(String(describing: result)) doesn't match with \(grid)")
    }
    
    func testCreateGrid_nil() {
        let result = sut.createGrid(from: [1])
        XCTAssertNil(result)
    }
    
    func testCreatePoints_success() {
        let pointsArray = [Point(x: 1, y: 2), Point(x: 3, y: 4)]
        let result = sut.createPoints(from: [1,2,3,4])
        XCTAssertEqual(result, pointsArray, "\(String(describing: result)) doesn't match with \(pointsArray)")
    }
        
    func testGenerateDirections() {
        let points = [Point(x: 4, y: 4), Point(x: 1, y: 3)]
        let result = sut.generateDirections(from: points)
        XCTAssertEqual(result, "EEEENNNNDWWWSD", "Output: \(result) doesn't match with expected result: EEEENNNNDWWWSD")
    }
    
    func testGetOverallDirections() {
        let result = sut.getOverallDirections(startPoint: Point(x: 1, y: 2), endPoint: Point(x: 5, y: 5))
        XCTAssertEqual(result, "EEEENNN", "Output: \(result) doesn't match with expected result: EEEENNN")
    }
    
    func testIsPointsFitGrid_true() {
        let result = sut.isPointsFitGrid(grid: Grid(width: 5, height: 5), points: [Point(x: 4, y: 4)])
        XCTAssertTrue(result)
    }
    
    func testIsPointsFitGrid_false() {
        let result = sut.isPointsFitGrid(grid: Grid(width: 5, height: 5), points: [Point(x: 6, y: 3)])
        XCTAssertFalse(result)
    }
    
    func testConvertToIntArray_success() {
        let result = sut.convertToIntArray(string: "(4,4)")
        XCTAssertEqual(result, [4,4], "Output: \(result!) doesn't match with expected array: [4, 4]")
    }
    
    func testConvertToIntArray_nil() {
        let result = sut.convertToIntArray(string: "Incorrect String")
        XCTAssertNil(result)
    }
}
