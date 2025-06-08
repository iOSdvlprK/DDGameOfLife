//
//  ControlView.swift
//  DDGameOfLife
//
//  Created by joe on 5/16/25.
//

import SwiftUI

struct ControlView: View {
    @Binding var showImage: Bool
    @Binding var currentImage: ImageResource
    @Binding var speed: Double
    @Binding var isPlaying: Bool
    @Binding var showDesignSelectionView: Bool
    
    var body: some View {
        VStack {
            Slider(value: $speed, in: 1...300, step: 0.5)
            
            HStack {
                ButtonView(name: "play") {
                    isPlaying.toggle()
                }
            }
        }
    }
}

struct ButtonView: View {
    let name: String
    let font: Font = .headline
    let color: Color = .white
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: name)
                .font(font)
                .foregroundStyle(color)
                .padding(10)
                .background(Circle().fill(color.opacity(0.2)))
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        Color.bg.ignoresSafeArea()
        
        ControlView(
            showImage: .constant(true),
            currentImage: .constant(.autumn1),
            speed: .constant(100.0),
            isPlaying: .constant(true),
            showDesignSelectionView: .constant(true)
        )
    }
}
