//
//  ColorSliderView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dmitrii Melnikov on 25.04.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    @State private var text = ""
    @State private var showAlert = false

    
    @FocusState var isFocused: Bool
    
    let color: Color
    
    var body: some View {
        HStack {
            TextView(sliderValue: sliderValue)
                .foregroundColor(color)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: sliderValue) { newValue in
                    text = "\(lround(newValue))"
                }
            
            TextFieldView(
                sliderValue: $sliderValue,
                text: $text,
                doneAction: validate,
                isFocused: _isFocused
            )
            .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                Text("Please enter value from 0 to 255")
            }
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
        .onAppear {
            text = lround(sliderValue).formatted()
        }
    }
    
    private func validate() {
        if let newSliderValue  = Int(text), (0...255).contains(newSliderValue) {
            sliderValue = Double(newSliderValue)
            return
        }
        showAlert.toggle()
        sliderValue = 0
        text = "0"
    }
}
