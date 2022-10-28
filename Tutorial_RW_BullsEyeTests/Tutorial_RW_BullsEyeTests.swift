//
//  Tutorial_RW_BullsEyeTests.swift
//  Tutorial_RW_BullsEyeTests
//
//  Created by Sedat Onat on 28.10.2022.
//

import XCTest
@testable import Tutorial_RW_BullsEye // Ekledik

final class Tutorial_RW_BullsEyeTests: XCTestCase { // Soldaki baklava isareti tiklandi
    
    var game: Game! // Ekledik
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game() // Ekledik
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil // Ekledik
    }
    
    func testExample() throws {  // Soldaki baklava isareti tiklandi
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        XCTAssertEqual(game.points(sliderValue: 50), 999) // Ekledik
    }
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
// Bu alani pasife aldik

// "Product / Test" 'e basarak calistirdik
    
    
    
}
