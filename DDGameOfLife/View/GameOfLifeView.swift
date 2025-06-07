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
    @State private var speed = 200.0
    @State private var showDesignSelectionView = true
    
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
                
                if showDesignSelectionView {
                    DesignSelectionView(selectedDesign: $selectedDesign, swapXY: $swapXY)
                }
                
                ControlView(
                    showImage: $showImage,
                    currentImage: $currentImage,
                    speed: $speed,
                    isPlaying: $isPlaying,
                    showDesignSelectionView: $showDesignSelectionView
                )
            }
            .padding()
        }
        .onAppear {
            // start game
            startGame()
        }
        .onChange(of: speed) { _, newSpeed in
            resetSpeed()
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
    
    func stopGame() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetSpeed() {
        stopGame()
        startGame()
    }
    
    // reset board and timer
    func resetGame() {
        board.clearBoard()
        stopGame()
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
