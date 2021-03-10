//
//  CurrentGame.swift
//  mstf
//
//  Created by 神田宗明 on 2021/03/10.
//

import Foundation

class CurrentGame {
    
    private (set) public var gameDate:Date? ;
    private (set) public var gameId:String? ;
    private (set) public var progress:String? ;
    private (set) public var surface:String? ;
    private (set) public var pastWins:String? ;
    private (set) public var score:Score? ;
    private (set) public var team:Team? ;
}
