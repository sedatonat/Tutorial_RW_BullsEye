//
//  TextViews.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 30.10.2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    
    var body: some View {
        
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
        
    }
}


struct BigNumberText: View {
    var text: String
    
    var body: some View {
        
        Text(text) // Text in icine Integer koyamayacagimiz icin onu String 'e cevirerek koyduk
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
        
    }
}





struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            // Light Mode - Portrait
            InstructionText(text: "text")
            BigNumberText(text: "999")
                .previewDisplayName("Light - P")
                .previewInterfaceOrientation(.portrait)
        }
        
        // Light Mode - Landscape - Left
        InstructionText(text: "text")
            .previewDisplayName("Light - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.fixed(width:568, height:320))
        
        // Dark Mode - Portrait
        InstructionText(text: "text")
            .previewDisplayName("Dark - P")
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.dark)
        
        // Dark Mode - Landscape - Left
        InstructionText(text: "text")
            .previewDisplayName("Dark - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width:568, height:320))
        
    }
}
