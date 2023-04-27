//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dmitrii Melnikov on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @FocusState var isFocused : Bool
            
    var body: some View {
        ZStack {
            Color(.cyan)
                .ignoresSafeArea()
                .onTapGesture {
                    isFocused = false
                }
            VStack {
                ColorView(
                    red: redSliderValue,
                    green: greenSliderValue,
                    blue: blueSliderValue
                )
                .padding()
                
                ColorSliderView(
                    sliderValue: $redSliderValue,
                    color: .red
                )
                ColorSliderView(
                    sliderValue: $greenSliderValue,
                    color: .green
                )
                ColorSliderView(
                    sliderValue: $blueSliderValue,
                    color: .blue
                )
                
                Spacer()
            }
            .focused($isFocused)
            .padding()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
