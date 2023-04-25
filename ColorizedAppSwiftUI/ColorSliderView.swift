//
//  ColorSliderView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dmitrii Melnikov on 25.04.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var sliderValue: Double
        
    @FocusState var isFocused: Bool
    
    var color: Color
        
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .frame(width: 35)
                .foregroundColor(color)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
            
            TextField(
                "",
                value: $sliderValue,
                formatter: NumberFormatter()
            )
            .onChange(of: sliderValue, perform: { newValue in
                if sliderValue > 255 {
                    sliderValue = 255
                }
            })
                .textFieldStyle(.roundedBorder)
                .frame(width: 46)
                .keyboardType(.numberPad)
                .focused($isFocused)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
    }
}
