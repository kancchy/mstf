//
//  Game.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/03/10.
//

import Foundation

class Game{
    private (set) var gamePoint:[GamePoint] = [];
    private (set) var gamePointCountTeamA:Int = 0;
    private (set) var gamePointCountTeamB:Int = 0;
    // サーバ/レシーバーにはチーム名が入る
    public var server:String = "" ;
    public var serverPlayerName:String = "" ;
    private (set) var reciever:String? ;
    var activePoint:GamePoint = GamePoint();
    
    public var scoredTeam:String = "";
    
    func scored(point:GamePoint){
        gamePoint.append(point)
        if point.scoredTeam == "A" {
            gamePointCountTeamA += 1
        } else {
            gamePointCountTeamB += 1
        }
        activePoint = GamePoint()
    }
    
    func cnvPoint(point:Int) -> String{
        let max: Int
        if gamePointCountTeamA >= 3 && gamePointCountTeamB >= 3 {
            if gamePointCountTeamA > gamePointCountTeamB {
                max = gamePointCountTeamA
            } else if gamePointCountTeamA < gamePointCountTeamB {
                max = gamePointCountTeamB
            } else{
                return Point.findPoint(point).rawValue
            }
            if max == point {
                return Point.Advantage.rawValue
            }
        }
        return Point.findPoint(point).rawValue
    }
    
    func isFinish(teamName:String) -> Bool{
        // 取得したポイントがAdまたは４０だったらgameを終わらせる
        if gamePointCountTeamA > gamePointCountTeamB && gamePointCountTeamA >= 3 && teamName == "A" {
            scoredTeam = "A";
            return true
        } else if gamePointCountTeamA < gamePointCountTeamB && gamePointCountTeamB >= 3 && teamName == "B" {
            scoredTeam = "B";
            return true
        } else{
            return false
        }
    }
    
    func findTheNameOfTheTeamThatGotTheGame() -> String{
        // gamePointに追加した一番最後のポイントを取ったチーム名を返す
        return gamePoint.last!.scoredTeam
    }
    
    
}
