//
//  DirectionBuilderTests.swift
//  PizzabotTests
//
//  Created by Uladzislau Volkau on 5/5/21.
//

import XCTest

class DirectionBuilderTests: XCTestCase {
    var sut: DirectionsBuilder!
    
    override func setUp() {
        super.setUp()
        sut = DirectionsBuilder()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGenerateDirections_correctInput() {
        let result = sut.generateDirections(input: "5x5 (1, 3) (4, 4)")
        XCTAssertEqual(result, "ENNNDEEEND", "Output: \(result) doesn't match with expected result: ENNNDEEEND")
    }
    
    func testGenerateDirections_emptyInput() {
        let result = sut.generateDirections(input: "")
        XCTAssertEqual(result, ErrorMessage.emptyInput, "Output: \(result) doesn't match with expected result: \(ErrorMessage.emptyInput)")
    }
    
    func testGenerateDirections_incorrectInput() {
        let result = sut.generateDirections(input: "Incorrect input")
        XCTAssertEqual(result, ErrorMessage.invalidFormat, "Output: \(result) doesn't match with expected result: \(ErrorMessage.invalidFormat)")
    }
    
    func testGenerateDirections_pointGreaterThanGrid() {
        let result = sut.generateDirections(input: "5x5 (1,6)")
        XCTAssertEqual(result, ErrorMessage.pointGreaterThanGrid, "Output: \(result) doesn't match with expected result: \(ErrorMessage.pointGreaterThanGrid)")
    }
}
