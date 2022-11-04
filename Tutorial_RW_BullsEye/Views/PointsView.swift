//
//  PointsView.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 4.11.2022.
//

import SwiftUI

struct PointsView: View {
    var body: some View {
        
        VStack (spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: "89")
            BodyText(text: "You scored 200 points\n🎉🎉🎉")
            Button(action: {}) {ButtonText(text:"Start New Round")}

        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
            .shadow(radius: 10,x:5, y:5) // Gave a 3d feel
        
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Light Mode - Portrait
        PointsView()
            .previewDisplayName("Light - P")
            .previewInterfaceOrientation(.portrait)
        
        // Light Mode - Landscape - Left
        PointsView()
            .previewDisplayName("Light - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
        //            .previewLayout(.fixed(width:568, height:320))
        
        // Dark Mode - Portrait
        PointsView()
            .previewDisplayName("Dark - P")
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.dark)
        
        // Dark Mode - Landscape - Left
        PointsView()
            .previewDisplayName("Dark - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
        //            .previewLayout(.fixed(width:568, height:320))
        
    }
}
