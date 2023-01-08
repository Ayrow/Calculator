//
//  SunMoonView.swift
//  Calculator
//
//  Created by Aymeric Pilaert on 07/01/2023.
//

import SwiftUI

struct SunMoonView: View {
    var lightMode: Bool
    var body: some View {
        
        HStack(spacing: 30) {
            Image(systemName: "sun.min")
                .foregroundColor(lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
                
            
            Image(systemName: "moon")
                .foregroundColor(lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor)
         
        }
        .imageScale(.large)
        .font(UIDevice.isIpad ? .title : .body)
        .fontWeight(UIDevice.isIpad ? .semibold : .regular)
        .padding()
        .background(secondaryBackground)
        .cornerRadius(20)
        
    }
}

struct SunMoonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SunMoonView(lightMode: true)
            SunMoonView(lightMode: false)
        }
    }
}
