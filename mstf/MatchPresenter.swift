//
//  MatchPresenter.swift
//  mstf
//
//  Created by 山口賢明 on 2021/03/24.
//

import Foundation
import UIKit

protocol MatchProtocol {
    func scoredPoint()
}

extension MatchProtocol{
    func scoredPoint(){
    }
}

class MatchPresenter:MatchProtocol{
    var delegete:MatchYamaguchiController? = nil;
    var game:Game? = nil;
    var set:Set? = nil;
    
    func scoredPoint(scoredTeam: String){
        let gamePoint = GamePoint()
        gamePoint.scoredTeam = scoredTeam
        game?.scored(point: gamePoint)
    }
    
    func changeButtonLabel(){
        let dispPoint1 = game?.cnvPoint(point:game!.gamePointCountTeamA)
        let dispPoint2 = game?.cnvPoint(point:game!.gamePointCountTeamB)
        delegete?.point1Btn.setTitle(dispPoint1, for: .normal)
        delegete?.point2Btn.setTitle(dispPoint2, for: .normal)
    }
    
    func startNewSet(){
        set = Set();
        self.startNewGame()
    }
    
    func startNewGame(){
        game = Game();
    }
    
//    func finishGame(){
//        set?.scored(game: gamePoint);
//        if /*セットが終わったかどうか*/{
//            if /*試合が終わったかどうか*/{
//                //試合終了
//            }else{
//                self.startNewSet()
//            }
//        }else{
//            self.startNewGame()
//        }
//    }
}
