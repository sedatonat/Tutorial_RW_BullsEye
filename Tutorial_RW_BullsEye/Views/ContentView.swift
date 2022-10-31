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
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                
                InstructionsView(game: $game)
                
                
                HStack {
                    Text("1")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(value: self.$sliderValue, in: 1...100) // "in: 1...100" sonrasinda "step:1" yazarsan 1'erli basamaklarla veriyor. Ayni Class icindeyse "self." kullanimina gerek yok #learn
                    Text("100")
                        .bold()
                        .foregroundColor(Color("TextColor"))
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
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient:
                                        Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                                       startPoint: .top, endPoint: .bottom
                        )
                    }
                )
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
    }
}

// ----------------

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "Put the Bullseye as close as you can to") // Ilgili modulde Preview 'un olmasi sart degil
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text:  String(game.target))
        }
    }
}


// --------------------------------------------------------

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Light Mode - Portrait
        ContentView()
            .previewDisplayName("Light - P")
            .previewInterfaceOrientation(.portrait)
        
        // Light Mode - Landscape - Left
        ContentView()
            .previewDisplayName("Light - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
        //            .previewLayout(.fixed(width:568, height:320))
        
        // Dark Mode - Portrait
        ContentView()
            .previewDisplayName("Dark - P")
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.dark)
        
        // Dark Mode - Landscape - Left
        ContentView()
            .previewDisplayName("Dark - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
        //            .previewLayout(.fixed(width:568, height:320))
        
    }
}
