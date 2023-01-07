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
            Image(systemName: "sun.min").imageScale(.large).foregroundColor(lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
            
            Image(systemName: "moon").imageScale(.large).foregroundColor(lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor)
         
        }.padding()
            .background(secondaryBackground).cornerRadius(20)
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
