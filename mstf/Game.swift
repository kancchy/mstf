//
//  Game.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/03/10.
//

import Foundation

class Game{
    private (set) var gamePoint:[GamePoint]?;
    private (set) var gamePointCountTeamA:Int = 0;
    private (set) var gamePointCountTeamB:Int = 0;
    // サーバ/レシーバーにはチーム名が入る
    private (set) var server:String? ;
    private (set) var reciever:String? ;
    
    func scored(point:GamePoint){
        gamePoint?.append(point)
        if point.scoredTeam == "A" {
            gamePointCountTeamA += 1
        } else {
            gamePointCountTeamB += 1
        }
    }
    func cnvPoint(point:Int) -> String{
        return Point.findPoint(point).rawValue
    }
}
