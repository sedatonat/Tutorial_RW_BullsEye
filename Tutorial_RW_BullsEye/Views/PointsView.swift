//
//  PointsView.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 4.11.2022.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
    
        VStack (spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(action: {
                alertIsVisible = false
                game.startNewRound(points: points)
            }) {ButtonText(text:"Start New Round")}

        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10,x:5, y:5) // Gave a 3d feel
        
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        
        // Light Mode - Portrait
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewDisplayName("Light - P")
            .previewInterfaceOrientation(.portrait)
        
        // Light Mode - Landscape - Left
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewDisplayName("Light - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
        //            .previewLayout(.fixed(width:568, height:320))
        
        // Dark Mode - Portrait
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewDisplayName("Dark - P")
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.dark)
        
        // Dark Mode - Landscape - Left
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewDisplayName("Dark - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
        //            .previewLayout(.fixed(width:568, height:320))
        
    }
}
