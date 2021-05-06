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
    var game:Game = Game();
    var set:Set = Set();
    var score:Score = Score();

    func scoredPoint(scoredTeam: String){
        game.activePoint.scoredTeam = scoredTeam
        // Gameが終わっているか判定

        print("game is Finish:" + game.isFinish(teamName: scoredTeam).description);
        if (game.isFinish(teamName: scoredTeam)) {
            game.scored(point: game.activePoint)
            self.finishGame();
        } else {
            game.scored(point: game.activePoint)
        }
    }
    
    func changeButtonLabel(){
        let dispPoint1 = game.cnvPoint(point:game.gamePointCountTeamA)
        let dispPoint2 = game.cnvPoint(point:game.gamePointCountTeamB)
        delegate?.point1Btn.setTitle(dispPoint1, for: .normal)
        delegate?.point2Btn.setTitle(dispPoint2, for: .normal)
    }
    
    func startNewSet(){
        set = Set();
        self.startNewGame()
        // stackViewにnewViewを追加する
        delegate?.team1StackView.addArrangedSubview(createStackViewCell())
        delegate?.team2StackView.addArrangedSubview(createStackViewCell2())
    }
    
    func startNewGame(){
        game = Game();
    }
    
    func finishGame(){
 
        set.scored(game: game);
        print("set is finish:" + set.isFinish(teamName: game.findTheNameOfTheTeamThatGotTheGame()).description);
        if set.isFinish(teamName: game.findTheNameOfTheTeamThatGotTheGame()) {
            score.scored(set: set);
            if score.isFinish(teamName: set.findTheNameOfTheTeamThatGotTheSet()){
                //試合終了
                score.finish();
                self.startNewSet()

            }else{
                self.startNewSet()
            }
        }else{
            self.startNewGame()
        }
        
        var test:UIView?  = delegate?.team1StackView.subviews.last
        var testLabel: UILabel?  = test!.subviews.first as? UILabel
        testLabel?.text = "\(set.numberOfGamesForTeamA)"
        test = delegate?.team2StackView.subviews.last
        testLabel  = test!.subviews.first as? UILabel
        testLabel?.text = "\(set.numberOfGamesForTeamB)"
    }
    
    func finishScore(){
           //試合終了
           score.finish();
           delegate?.point1Btn.isEnabled = false
           delegate?.point2Btn.isEnabled = false
       }
    
    func fault(faultTeam: String){
        if game.activePoint.fault {
            // ポイント加算
            game.activePoint.scoredTeam = faultTeam == "A" ? "B" : "A"
            self.scoredPoint(scoredTeam: game.activePoint.scoredTeam)
            return
        }
        //フォルトフラグ真偽逆転
        game.activePoint.fault = true
    }
    
    func createStackViewCell() -> UIView {
        // 新規追加するViewを作成
        let newView = UIView()
        let label = UILabel()
        newView.addSubview(label);
        // 背景を緑に設定
        newView.backgroundColor = UIColor.green
        // 枠線を設定
        newView.layer.borderColor = UIColor.black.cgColor
        newView.layer.borderWidth = 1.0
        // 追加されたViewがわかりやすいように、ナンバリング
        label.text = "A"
        label.sizeToFit()
        label.textColor = UIColor.black
        label.tag = 1

        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView;
    }
    
    func createStackViewCell2() -> UIView {
        // 新規追加するViewを作成
        let newView = UIView()
        let label = UILabel()
        newView.addSubview(label);
        // 背景を緑に設定
        newView.backgroundColor = UIColor.yellow
        // 枠線を設定
        newView.layer.borderColor = UIColor.black.cgColor
        newView.layer.borderWidth = 1.0
        // 追加されたViewがわかりやすいように、ナンバリング
        label.text = "B"
        label.sizeToFit()
        label.textColor = UIColor.black
        label.tag = 2
        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView;
    }

}
