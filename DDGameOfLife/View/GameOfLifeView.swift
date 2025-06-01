//  GameOfLifeView.swift
//
//  DDGameOfLife
//
//  Created by joe on 5/15/25.
//

import SwiftUI

struct GameOfLifeView: View {
    @State private var board: BoardModel = BoardModel(gridSize: 50)
    @State private var selectedDesign: DesignType = .tub
    @State private var swapXY: Bool = false
    @State private var currentImage: ImageResource = .mountain1
    @State private var showImage: Bool = true
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                TitleView()
                
                Spacer()
                
                BoardView(
                    board: $board,
                    selectedDesign: $selectedDesign,
                    swapXY: $swapXY,
                    currentImage: $currentImage,
                    showImage: $showImage
                )
                
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
