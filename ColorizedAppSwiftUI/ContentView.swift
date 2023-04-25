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
                    text: $text,
                    isFocused: _isFocused,
                    color: .red
                )
                ColorSliderView(
                    sliderValue: $greenSliderValue,
                    text: $text,
                    isFocused: _isFocused,
                    color: .green
                )
                ColorSliderView(
                    sliderValue: $blueSliderValue,
                    text: $text,
                    isFocused: _isFocused,
                    color: .blue
                )
                Spacer()
            }
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

//struct ColorSliderView: View {
//    @Binding var sliderValue: Double
//    @Binding var text: String
//
//    @FocusState var isFocused: Bool
//
//    var color: Color
//
//    var body: some View {
//        HStack {
//            Text("\(lround(sliderValue))")
//                .frame(width: 35)
//                .foregroundColor(color)
//            Slider(value: $sliderValue, in: 0...255, step: 1)
//                .accentColor(color)
//            TextField(
//                "",
//                value: $sliderValue,
//                formatter: NumberFormatter()
//            )
//                .textFieldStyle(.roundedBorder)
//                .frame(width: 46)
//                .keyboardType(.numberPad)
//                .focused($isFocused)
//        }
//        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
//    }
//}
