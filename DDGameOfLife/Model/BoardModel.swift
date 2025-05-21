//
//  BoardModel.swift
//  DDGameOfLife
//
//  Created by joe on 5/20/25.
//

import Foundation

struct BoardModel {
    var gridSize: Int
    var creatures: [[Int]] = []
    
    init(gridSize: Int) {
        self.gridSize = gridSize
        self.randomBoard()
    }
    
    mutating func randomBoard() {
        creatures = []
        
        for _ in 0..<gridSize {
            creatures.append(
                Array(repeating: 0, count: gridSize).map { _ in
                    Int.random(in: 0...1)
                }
            )
        }
    }
    
    mutating func clearBoard() {
        creatures = Array(
            repeating: Array(repeating: 0, count: gridSize),
            count: gridSize
        )
    }
    
    func countLiveNeighbors(row: Int, col: Int) -> Int {
        let directions: [(x: Int, y: Int)] = [
            (-1,-1), (0,-1), (1,-1),
            (-1,0), (1,0),
            (-1,1), (0,1), (1,1)
        ]
        var count = 0
        
        for direction in directions {
            // let newRow = row + direction.x
            let newRow = (row + direction.x + gridSize) % gridSize // to avoid overflow
            let newCol = (col + direction.y + gridSize) % gridSize
            count += self.creatures[newRow][newCol]
        }
        
        return count
    }
    
    mutating func safelyAssignCreatureState(i: Int, j: Int, state: Int) {
        let safeRow = (i + gridSize) % gridSize
        let safeCol = (j + gridSize) % gridSize
        self.creatures[safeRow][safeCol] = state
    }
}

enum DesignType: String, CaseIterable {
    case block, beehive, loaf, tub // still life
    case blinker, toad, beacon, pentaDecathlon // oscillators
    case glider, LWSS, MWSS, HWSS // space ships
    
//    var offsetDesign: [(x: Int, y: Int)] {
//        switch self {
//        case .block:
//            return [(-1,-1), (0,-1), (-1,0), (0,0)]
//        case .beehive:
//            return []
//        case .loaf:
//            return []
//        case .tub:
//            return []
//        case .blinker:
//            return []
//        case .toad:
//            return []
//        case .beacon:
//            return []
//        case .pentaDecathlon:
//            return []
//        case .glider:
//            return []
//        case .LWSS:
//            return []
//        case .MWSS:
//            return []
//        case .HWSS:
//            return []
//        }
//    }
}
