//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dmitrii Melnikov on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var color: Color = .red
    @State private var text = "255"
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    @FocusState var isFocused : Bool
            
    var body: some View {
        ZStack {
            Color(.cyan)
                .ignoresSafeArea()
            VStack {
                ColorView(
                    color: UIColor(
                        red: redSliderValue / 255,
                        green: greenSliderValue / 255,
                        blue: blueSliderValue / 255,
                        alpha: 1
                    )
                )
                    .padding()
                ColorSliderView(
                    sliderValue: $redSliderValue,
                    isFocused: _isFocused,
                    color: .red
                )
                ColorSliderView(
                    sliderValue: $greenSliderValue,
                    isFocused: _isFocused,
                    color: .green
                )
                ColorSliderView(
                    sliderValue: $blueSliderValue,
                    isFocused: _isFocused,
                    color: .blue
                )
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
