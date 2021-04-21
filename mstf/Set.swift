//
//  Set.swift
//  mstf
//
//  Created by 神田宗明 on 2021/03/10.
//

import Foundation
class Set {
    private (set) var gameCount:[Game] = [] ;
    private (set) var numberOfGamesForTeamA:Int = 0 ;
    private (set) var numberOfGamesForTeamB:Int = 0 ;
    private (set) var breakGames:[Int]? ;
    private (set) var gameNumOneSet:Int = 6 ;

    
    func scored(game:Game?){
        let teamName = game?.findTheNameOfTheTeamThatGotTheGame()
        if teamName == "A" {
            numberOfGamesForTeamA += 1
        } else {
            numberOfGamesForTeamB += 1
        }
    }
    
    func isFinish(teamName:String) -> Bool{
        // 取得したポイントがAdまたは４０だったらgameを終わらせる
         //5-5終わらない
         //6-5
         //6-6
         //5-4以下
        print("game count::" + numberOfGamesForTeamA.description);
        if teamName == "A" && numberOfGamesForTeamA >= gameNumOneSet {
            return true;
        } else {
            return false;
        }
    }
    
    func findTheNameOfTheTeamThatGotTheSet() -> String{
        // gameCountに追加した一番最後のポイントを取ったチーム名を返す
        return "A";
    }
    
    public func findGame(gameNoLabel gameNo:Int) {
        
    }
}
