//
//  Score.swift
//  mstf
//
//  Created by 神田宗明 on 2021/03/10.
//

import Foundation

/// スコアドメインクラス
/// - parameter setCount: セットカウント（Setクラスの配列）
class Score {
    private (set) var setCount:[Set] = [];
    private (set) var numberOfSetsForTeamA:Int = 0 ;
    private (set) var numberOfSetsForTeamB:Int = 0 ;
    private (set) var setNumOneScore:Int = 1 ;

    func scored(set:Set?){
        let teamName = set?.findTheNameOfTheTeamThatGotTheSet()
        if teamName == "A" {
            numberOfSetsForTeamA += 1
        } else {
            numberOfSetsForTeamB += 1
        }
    }

    
    func isFinish(teamName:String) -> Bool{
        print("set count:" + numberOfSetsForTeamA.description);
        if teamName == "A" && numberOfSetsForTeamA >= setNumOneScore {
            return true;
        } else {
            return false;
        }
    }
    
    func finish(){
        print("game is over!!!!!!");

    }
}
