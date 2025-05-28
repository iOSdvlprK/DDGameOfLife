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
    case block, beehive, loaf, boat, tub // still life
    case blinker, toad, beacon, pulsar, pentaDecathlon // oscillators
    case glider, LWSS, MWSS, HWSS // space ships
    
    var offsetDesign: [(x: Int, y: Int)] {
        switch self {
        // still life
        case .block:
            return [
                (0, -1),
                (1, -1),
                (0, 0),
                (1, 0),
            ]
        case .beehive:
            return [
                (-1, -1),
                (0, -1),
                (-2, 0),
                (1, 0),
                (-1, 1),
                (0, 1),
            ]
        case .loaf:
            return [
                (-1, -1),
                (0, -1),
                (-2, 0),
                (1, 0),
                (-1, 1),
                (1, 1),
                (0, 2),
            ]
        case .boat:
            return [
                (-1, -1),
                (0, -1),
                (-1, 0),
                (1, 0),
                (0, 1),
            ]
        case .tub:
            return [
                (0, -1),
                (-1, 0),
                (1, 0),
                (0, 1),
            ]
            
        // oscillators
        case .blinker:
            return [
                (0, -1),
                (0, 0),
                (0, 1),
            ]
        case .toad:
            return [
                (1, -2),
                (-1, -1),
                (2, -1),
                (-1, 0),
                (2, 0),
                (0, 1),
            ]
        case .beacon:
            return [
                (-2, -2),
                (-1, -2),
                (-2, -1),
                (-1, -1),
                (0, 0),
                (1, 0),
                (0, 1),
                (1, 1),
            ]
        case .pulsar:
            return [
                (-4, -6),
                (-3, -6),
                (-2, -6),
                (2, -6),
                (3, -6),
                (4, -6),
                (-6, -4),
                (-1, -4),
                (1, -4),
                (6, -4),
                (-6, -3),
                (-1, -3),
                (1, -3),
                (6, -3),
                (-6, -2),
                (-1, -2),
                (1, -2),
                (6, -2),
                (-4, -1),
                (-3, -1),
                (-2, -1),
                (2, -1),
                (3, -1),
                (4, -1),
                (-4, 1),
                (-3, 1),
                (-2, 1),
                (2, 1),
                (3, 1),
                (4, 1),
                (-6, 2),
                (-1, 2),
                (1, 2),
                (6, 2),
                (-6, 3),
                (-1, 3),
                (1, 3),
                (6, 3),
                (-6, 4),
                (-1, 4),
                (1, 4),
                (6, 4),
                (-4, 6),
                (-3, 6),
                (-2, 6),
                (2, 6),
                (3, 6),
                (4, 6),
            ]
        case .pentaDecathlon:
            return [
                (-1, -4),
                (0, -4),
                (1, -4),
                (-1, -3),
                (1, -3),
                (-1, -2),
                (0, -2),
                (1, -2),
                (-1, -1),
                (0, -1),
                (1, -1),
                (-1, 0),
                (0, 0),
                (1, 0),
                (-1, 1),
                (0, 1),
                (1, 1),
                (-1, 2),
                (1, 2),
                (-1, 3),
                (0, 3),
                (1, 3),
            ]
            
        // spaceships
        case .glider:
            return [
                (0, -1),
                (1, 0),
                (-1, 1),
                (0, 1),
                (1, 1),
            ]
        case .LWSS:
            return [
                (0, -1),
                (1, -1),
                (-2, 0),
                (-1, 0),
                (1, 0),
                (2, 0),
                (-2, 1),
                (-1, 1),
                (0, 1),
                (1, 1),
                (-1, 2),
                (0, 2),
            ]
        case .MWSS:
            return [
                (-2, -2),
                (-1, -2),
                (0, -2),
                (1, -2),
                (2, -2),
                (-3, -1),
                (2, -1),
                (2, 0),
                (-3, 1),
                (1, 1),
                (-1, 2),
            ]
        case .HWSS:
            return [
                (-3, -2),
                (-2, -2),
                (-1, -2),
                (0, -2),
                (1, -2),
                (2, -2),
                (-4, -1),
                (2, -1),
                (2, 0),
                (-4, 1),
                (1, 1),
                (-2, 2),
                (-1, 2),
            ]
        }
    }
}
