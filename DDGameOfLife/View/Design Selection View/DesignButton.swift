//
//  DesignButton.swift
//  DDGameOfLife
//
//  Created by joe on 6/11/25.
//

import SwiftUI

struct DesignButton: View {
    let design: DesignType
    let color: Color
    let selectedDesign: DesignType
    
    var isSelected: Bool {
        selectedDesign == design
    }
    
    var body: some View {
        Text(design.rawValue.capitalized)
            .foregroundStyle(.white)
            .font(.caption)
            .fontWeight(.medium)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(color.gradient)
                    .opacity(isSelected ? 1 : 0.8)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.black, lineWidth: isSelected ? 2 : 0)
            }
            .scaleEffect(isSelected ? 1.05 : 1)
    }
}

#Preview {
    HStack {
        DesignButton(
            design: .tub,
            color: .red,
            selectedDesign: .HWSS
        )
        DesignButton(
            design: .tub,
            color: .red,
            selectedDesign: .tub
        )
    }
}
