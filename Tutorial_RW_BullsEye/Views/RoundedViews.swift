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

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageViewStroked()
    }
}
