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
                ColorSlider(color: .red, sliderValue: $redSliderValue)
                ColorSlider(color: .green, sliderValue: $greenSliderValue)
                ColorSlider(color: .blue, sliderValue: $blueSliderValue)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    var color: Color
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(color)
            Slider(value: $sliderValue, in: 0...255, step: 1)
            Text("255").foregroundColor(color)
//            TextField("0.00", text: $sliderText)
//                .textFieldStyle(.roundedBorder)
//                .frame(width: 46)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
    }
}
