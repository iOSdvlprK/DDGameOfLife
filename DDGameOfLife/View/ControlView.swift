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
                Text("Buttons - TODO")
            }
        }
    }
}

#Preview {
    ControlView(
        showImage: .constant(true),
        currentImage: .constant(.autumn1),
        speed: .constant(100.0),
        isPlaying: .constant(true),
        showDesignSelectionView: .constant(true)
    )
}
