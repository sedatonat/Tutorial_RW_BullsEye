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
    
    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    // istenilen sonucun alınıp alınmadığının kontrolü
    func testScoreExact() {
        let guess = game.target
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() {
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testRestart() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0) // Hiçbir puan alınmamış olacak
        XCTAssertNotEqual(game.round, 1) // İlk roun olacak
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
    
//    func testExample() throws {  // Soldaki baklava isareti tiklandi
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//        XCTAssertEqual(game.points(sliderValue: 50), 999) // Ekledik
//    }
  // Bu alani once calistikdik sonra pasife aldik
    
    
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
  // Bu alani pasife aldik

// "Product / Test" 'e basarak calistirdik
    
    
    func testLeaderboard() {
      game.startNewRound(points: 100)
      XCTAssertEqual(game.leaderboardEntries.count, 1)
      XCTAssertEqual(game.leaderboardEntries[0].score, 100)
      game.startNewRound(points: 200)
      XCTAssertEqual(game.leaderboardEntries.count, 2)
      XCTAssertEqual(game.leaderboardEntries[0].score, 200)
      XCTAssertEqual(game.leaderboardEntries[1].score, 100)
    }
    
    
    
    
}
