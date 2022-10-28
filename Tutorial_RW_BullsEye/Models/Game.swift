//
//  Game.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 27.10.2022.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100) // Documentation dosyasindan bakip bulduk
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {  // "->" isareti fonksiyonun ne yapmasi gerektigini belirtiyor. Int ise cikacak sonucun formatini belirliyor
        var difference: Int
        if sliderValue > self.target {
            difference = sliderValue - self.target
        } else if self.target > sliderValue {
            difference = self.target - sliderValue
        } else {
            difference = 0
        }
        var awardedPoints: Int = 100 - difference
        return awardedPoints
    }
}
