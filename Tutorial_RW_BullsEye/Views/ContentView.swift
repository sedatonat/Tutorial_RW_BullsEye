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
            BackgroundView(game: $game)
            
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom,alertIsVisible ? 0 : 100)
                
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue) // Bunu ayırıp tam ortaya denk getirdi
                    .transition(.scale)
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


// ----------------

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}


// ----------------

// Anlamadihgim icin buranin tamamini Tutorial 'dan kopyaladim (https://www.kodeco.com/28797859-your-first-ios-swiftui-app-polishing-the-app/lessons/7)

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        
        
        
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


// FINISHED
