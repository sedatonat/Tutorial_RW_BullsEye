//
//  RoundedViews.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 1.11.2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String = "arrow.counterclockwise" // Tutoriel 'da bu Preview kismindaydi. ben buraya aldim
    
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height:56.0)
    }
}


struct RoundedViews_Previews2: PreviewProvider {
    static var previews: some View {
        
        // Light Mode - Portrait
        RoundedImageViewStroked()
            .previewDisplayName("Light - P")
            .previewInterfaceOrientation(.portrait)
        
        // Light Mode - Landscape - Left
        RoundedImageViewStroked()
            .previewDisplayName("Light - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
            .previewLayout(.fixed(width:568, height:320))
        
        // Dark Mode - Portrait
        RoundedImageViewStroked()
            .previewDisplayName("Dark - P")
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.dark)
        
        // Dark Mode - Landscape - Left
        RoundedImageViewStroked()
            .previewDisplayName("Dark - LS_L")
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width:568, height:320))
        
    }
}
