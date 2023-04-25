//
//  ColorView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dmitrii Melnikov on 24.04.2023.
//

import SwiftUI

struct ColorView: View {
    var color: UIColor
    
    var body: some View {
        Color(color)
            .frame(width: 350, height: 200)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: .red)
    }
}
