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
        Text("Sun Moon View")
    }
}

struct SunMoonView_Previews: PreviewProvider {
    static var previews: some View {
        SunMoonView(lightMode: true)
    }
}
