//
//  TextFieldView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dmitrii Melnikov on 27.04.2023.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var sliderValue: Double
    @Binding var text: String
    
    let doneAction: () -> Void
        
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                doneAction()
            }
        }
        .textFieldStyle(.roundedBorder)
        .frame(width: 46)
        .keyboardType(.numberPad)        
    }
}
