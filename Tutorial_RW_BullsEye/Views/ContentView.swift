//
//  ContentView.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 23.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0 // burada ".0" kismi onemli cunku ancak o sayede sistem onun Double oldugunu anliyor. aksi halde calismaz
    @State private var game = Game() // "Game = Game()" New Instance of Game demek
    
    
    var body: some View {
        
        ZStack{
            
            Color(red: 243.0 / 255.0, green: 248.0 / 255.0, blue: 253.0 / 255.0)
                .ignoresSafeArea()
                
            VStack {
                Text("🎯🎯🎯\n Put the Bullseye as close as you can".uppercased())
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
                    Slider(value: self.$sliderValue, in: 1...100) // "in: 1...100" sonrasinda "step:1" yazarsan 1'erli basamaklarla veriyor. Ayni Class icindeyse "self." kullanimina gerek yok #learn
                    Text("100")
                        .bold()
                }
                .padding()
                    
                Button(action: {
                    print("Test")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me".uppercased())
                        .font(.title3)
                        .bold()
                }
                        .padding(20.0)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(21)
                
                // This whole part was copied from the Tutorial
                .alert("Hello there!", isPresented: $alertIsVisible) {
                    Button("Awesome!") { }
                  } message: {
                    let roundedValue = Int(sliderValue.rounded())
                    Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round.")
                  }
                
            }

            
        }
        .ignoresSafeArea()
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
