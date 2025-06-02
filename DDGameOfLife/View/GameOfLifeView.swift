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
    
    @State private var timer: Timer?
    @State private var isPlaying = true
    
    let MIN_SECONDS: Double = 0.01
    let MAX_SECONDS: Double = 3.0
    let MAX_SPEED: Double = 10.0
    var MAX_TIME: Double { MAX_SPEED / 2 }
    var a: Double { (MIN_SECONDS - MAX_SECONDS) / MAX_SPEED } // slope
    var speed: Double { 1 / a * (MAX_TIME - MAX_SECONDS) }
    
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
        .onAppear {
            // start game
            startGame()
        }
        .onChange(of: speed) { _, newSpeed in
            // reset speed to newSpeed
        }
    }
    
    func startGame() {
        timer?.invalidate() // stops existing timer
        timer = Timer.scheduledTimer(
            withTimeInterval: 1 / speed,
            repeats: true,
            block: { _ in
                withAnimation {
                    if isPlaying {
                        // create the next generation
                        board.nextGeneration()
                    }
                }
            }
        )
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
