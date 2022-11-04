//
//  TextViews.swift
//  Tutorial_RW_BullsEye
//
//  Created by Sedat Onat on 30.10.2022.
//

import SwiftUI


// ----------------

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


// ----------------

struct SliderLabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0) // ContentView 'da sliderdaki 50 pozisyonu tam ortaya gelsin diye
    }
}


// ----------------

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
    }
}


// ----------------

struct BodyText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
        
    }
}


// ----------------

struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}


// ----------------

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


// --------------------------------------------------------

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "99")
            LabelText(text: "9")
            BodyText(text: "You scored 200 points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
                .padding() // Only for preview purpose
        }
        
    }
}
