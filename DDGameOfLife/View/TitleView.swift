//
//  TitleView.swift
//  DDGameOfLife
//
//  Created by joe on 5/16/25.
//

import SwiftUI

struct TitleView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var gradientColors: [Color] {
        colorScheme == .light ?
        [.white, .pink, .red] :
        [.blue, .purple, .white]
    }
    var shadowColor: Color {
        colorScheme == .light ? .red.opacity(0.3) : .purple.opacity(0.5)
    }
    
    var body: some View {
        Text("Game of Life")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(
                LinearGradient(
                    colors: gradientColors,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .shadow(color: shadowColor, radius: 10, x: 0, y: 5)
    }
}

#Preview {
    TitleView()
}
