//
//  BackgroundView.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 2.11.2022.
//

import SwiftUI


// ---------------------------------------
// Top part

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false // Default setting
    var body: some View {
        HStack {
            
            //-A
            Button(
                action: {
                    game.restart()
                }) {
                    RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                }
            //-Z
            
            Spacer()
            
            Button(
                action:
                    {
                        leaderboardIsShowing = true // Shows the View
                    })
            {
                RoundedImageViewFilled(systemName: "list.dash")
            }
            .sheet(
                isPresented: $leaderboardIsShowing,
                onDismiss: {},
                content:{ LeaderboardView(
                    leaderboardIsShowing: $leaderboardIsShowing, game: $game
                ) } // Doesn't work w/o curly brackets
            )
            
        }
    }
}


// ---------------------------------------

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3 // short form of If-else statement
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(
                            gradient:
                                Gradient(
                                    colors: [
                                        Color("RingsColor").opacity(opacity),
                                        Color("RingsColor").opacity(opacity)
                                    ]
                                ),
                            center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                            startRadius: 100,
                            endRadius: 300
                        )

                    )
                    .frame(width: size, height: size)
            }
        }
    }
}


// ---------------------------------------
// Bottom part

struct NumberView: View {
    var title: String
    var text: String
    var body: some View {
        VStack (spacing: 5) {
            LabelText(text: title.uppercased())
            RoundRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            NumberView(
                title: "Score",
                text: String(game.score) // Skoru String 'e cevirdik
            )
            Spacer()
            NumberView(
                title: "Round",
                text: String(game.round) // Roundu String 'e cevirdik
            )
        }
    }
}


// ---------------------------------------
// Collecting all the parts together

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background( RingsView() )
    }
}


// ---------------------------------------

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
