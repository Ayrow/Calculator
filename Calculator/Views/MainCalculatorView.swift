//
//  MainCalculatorView.swift
//  Calculator
//
//  Created by Aymeric Pilaert on 07/01/2023.
//

import SwiftUI

struct MainCalculatorView: View {
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        ZStack {
            primaryBackground.ignoresSafeArea()
            
            VStack {
                SunMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation{
                            lightMode.toggle()
                        }
                    }
                
                Spacer()
                
                ComputationView(currentComputation: currentComputation, mainResult: mainResult)
                    .padding(.horizontal, UIDevice.isIpad ? UIScreen.main.bounds.width * 0.1 : 0)
                
                Spacer()
                
                CalcsButtonsView(currentComputation: $currentComputation, mainResult: $mainResult)
                
                if UIDevice.isIpad {
                    Spacer()
                }
            }
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}

struct MainCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MainCalculatorView()
    }
}
