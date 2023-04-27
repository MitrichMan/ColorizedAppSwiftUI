//
//  TextView.swift
//  ColorizedAppSwiftUI
//
//  Created by Dmitrii Melnikov on 27.04.2023.
//

import SwiftUI

struct TextView: View {
    let sliderValue: Double

    var body: some View {
        Text("\(lround(sliderValue))")
            .frame(width: 35)
    }
}
