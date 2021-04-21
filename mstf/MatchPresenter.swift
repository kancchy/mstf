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
    var delegate:MatchYamaguchiController? = nil;
    var game:Game? = nil;
    var set:Set? = nil;
    var score:Score = Score();

    
    func scoredPoint(scoredTeam: String){
        let gamePoint = GamePoint()
        gamePoint.scoredTeam = scoredTeam
        // Gameが終わっているか判定
        print("game is Finish:" + game!.isFinish(teamName: scoredTeam).description);
        if (game!.isFinish(teamName: scoredTeam)) {
            game?.scored(point: gamePoint)
            self.finishGame();
        } else {
            game?.scored(point: gamePoint)
        }
    }
    
    func changeButtonLabel(){
        let dispPoint1 = game?.cnvPoint(point:game!.gamePointCountTeamA)
        let dispPoint2 = game?.cnvPoint(point:game!.gamePointCountTeamB)
        delegate?.point1Btn.setTitle(dispPoint1, for: .normal)
        delegate?.point2Btn.setTitle(dispPoint2, for: .normal)
    }
    
    func startNewSet(){
        set = Set();
        self.startNewGame()
    }
    
    func startNewGame(){
        game = Game();
    }
    
    func finishGame(){
        set?.scored(game: game);
        print("set is inish:" + set!.isFinish(teamName: game!.findTheNameOfTheTeamThatGotTheGame()).description);
        if set!.isFinish(teamName: game!.findTheNameOfTheTeamThatGotTheGame()) {
            score.scored(set: set);
            if score.isFinish(teamName: set!.findTheNameOfTheTeamThatGotTheSet()){
                //試合終了
                score.finish();
            }else{
                self.startNewSet()
            }
        }else{
            self.startNewGame()
        }
    }
    
    func finishScore(){
           //試合終了
           score.finish();
           delegate?.point1Btn.isEnabled = false
           delegate?.point2Btn.isEnabled = false
       }
}
