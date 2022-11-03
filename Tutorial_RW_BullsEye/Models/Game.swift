//
//  Game.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 27.10.2022.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100) // Documentation dosyasindan bakip bulduk
    var score = 0
    var round = 1
    
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
    
    mutating func startNewRound(points: Int) { // Yukarida koydugumuz "-> Int" neden burada yok? #learn
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
}
