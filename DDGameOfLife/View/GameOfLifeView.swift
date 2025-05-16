//
//  GameOfLifeView.swift
//  DDGameOfLife
//
//  Created by joe on 5/15/25.
//

import SwiftUI

struct GameOfLifeView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                TitleView()
                
                Spacer()
                
                BoardView()
                
                Spacer()
                
                ControlView()
            }
            .padding()
        }
    }
}

#Preview("Light Mode") {
    GameOfLifeView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    GameOfLifeView()
        .preferredColorScheme(.dark)
}
