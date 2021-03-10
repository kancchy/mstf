//
//  Game.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/03/10.
//

import Foundation

class Game{
    private (set) var gamePoint:String? ;
    private (set) var gamePointCountTeamA:Int? ;
    private (set) var gamePointCountTeamB:Int? ;
    // サーバ/レシーバーにはチーム名が入る
    private (set) var server:String? ;
    private (set) var reciever:String? ;
}
