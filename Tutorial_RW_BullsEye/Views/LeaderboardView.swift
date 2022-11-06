//
//  LeaderboardVıew.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 6.11.2022.
//

import SwiftUI


struct HeaderView: View {
    var body: some View {
        ZStack {
            BigBoldText(text: "LeaderBoard")
            HStack {
                Spacer()
                
                Button(
                    action:
                        {
                            
                        })
                {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
                
                
            }
        }
    }
}


// ----------------

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}



// ----------------

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity) // .infinity makes it perfect round
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            
            )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}


// ----------------

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 10) {
                HeaderView()
                LabelView()
                RowView(index: 1, score: 10, date: Date())
            }
//            .background(Color("BackgroundColor")) // Bu sadece kapsadığı alan kadar etki ediyor. ZStack içindeki ise tüm ekrana etki ediyor
        }
    }
}


// ----------------

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
                
                // Light Mode - Portrait
                LeaderboardView()
                    .previewDisplayName("Light - P")
                    .previewInterfaceOrientation(.portrait)
                
                // Light Mode - Landscape - Left
                LeaderboardView()
                    .previewDisplayName("Light - LS_L")
                    .previewInterfaceOrientation(.landscapeLeft)
                    .previewLayout(.fixed(width:568, height:320))
                
                // Dark Mode - Portrait
                LeaderboardView()
                    .previewDisplayName("Dark - P")
                    .previewInterfaceOrientation(.portrait)
                    .preferredColorScheme(.dark)
                
                // Dark Mode - Landscape - Left
                LeaderboardView()
                    .previewDisplayName("Dark - LS_L")
                    .previewInterfaceOrientation(.landscapeLeft)
                    .preferredColorScheme(.dark)
                    .previewLayout(.fixed(width:568, height:320))
                
    }
}
