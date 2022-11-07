//
//  Game.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 27.10.2022.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}


struct Game {
    var target = Int.random(in: 1...100) // Documentation dosyasindan bakip bulduk
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    // Previous form
    //    func points(sliderValue: Int) -> Int {  // "->" isareti fonksiyonun ne yapmasi gerektigini belirtiyor. Int ise cikacak sonucun formatini belirliyor
    //        100 - abs(target - sliderValue) // Eger tek satir bir kod varsa buna return eklemek zorunda degilsin Swift onu anliyor zaten. Burada "self." da kullanmadik cunku ayni class icerisinde
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        //--
        if difference == 0 { bonus = 100 }
        else if difference <= 2 { bonus = 50 }
        else { bonus = 0 }
        //--
        return 100 - difference + bonus
    }
    
    mutating func addToLeaderboard(point: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    
    mutating func startNewRound(points: Int) { // Yukarida koydugumuz "-> Int" neden burada yok? #learn
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(point: points)
    }
    
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
        //        addToLeaderboard(point: score)
    }
    
    
}
