//
//  ContentView.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 23.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 10
    @State private var game: Game = Game() // "Game = Game()" New Instance of Game demek
    
    
    var body: some View {
        
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target)) // Text in icine Integer koyamayacagimiz icin onu String 'e cevirerek koyduk
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            
            HStack {
                Text("1")
                    .bold()
                Slider(value: self.$sliderValue, in: 1...100) // "in: 1...100" sonrasinda "step:1" yazarsan 1'erli basamaklarla veriyor
                Text("100")
                    .bold()
            }
                
            Button(action: {
                print("Test")
                self.alertIsVisible = true
            }) {
                Text("Hit me")
            }
            
            // This whole part was copied from the Tutorial
            .alert("Hello there!", isPresented: $alertIsVisible) {
                Button("Awesome!") { }
              } message: {
                let roundedValue = Int(sliderValue.rounded())
                Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round.")
              }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(
                .fixed(width:568, height:320)
            )
    }
}
