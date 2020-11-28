//
//  BookButtonStyle.swift
//  TheFork
//
//  Created by Victor Socaciu on 27.11.2020.
//

import SwiftUI

struct BookButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.headline)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.theForkGreen))
    }
}
