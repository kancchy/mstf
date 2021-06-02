//
//  VerticalMatchScreenOperationsPresenter.swift
//  mstf
//
//  Created by 神田宗明 on 2021/06/02.
//

import Foundation
import UIKit


class VerticalMatchScreenOperationsPresenter : MatchScreenOperationsParentPresenter{
    override func updatePoint(game:Game) {
        let dispPoint1 = game.cnvPoint(point:game.gamePointCountTeamA)
        let dispPoint2 = game.cnvPoint(point:game.gamePointCountTeamB)
        // stackViewにnewViewを追加する
        delegate?.leftGameLineParent.addArrangedSubview(createStackViewCell(convertedPoint: dispPoint1))

        delegate?.rightGameLineParent.addArrangedSubview(createStackViewCell2(convertedPoint: dispPoint2))
    }
    
    override func addSetCount(score:Score) {
        // stackViewにnewViewを追加する
        delegate?.leftSetNumParent.text = "\(score.numberOfSetsForTeamA)"
        delegate?.rightSetNumParent.text = "\(score.numberOfSetsForTeamB)"
    }
    
    override func changeServerTeamBackgroundColor(serverName:String){
        // 仮：サーバーチームを色変え
        if serverName == "A"{
            delegate?.rightGameLineParent.backgroundColor = UIColor.red
            delegate?.leftGameLineParent.backgroundColor = UIColor.clear
        }else{
            delegate?.leftGameLineParent.backgroundColor = UIColor.red
            delegate?.rightGameLineParent.backgroundColor = UIColor.clear
        }
    }
    
    override func updateGameCount(set:Set){
        // 画面にゲームを反映
        delegate?.leftGameNumParent?.text = "\(set.numberOfGamesForTeamA)"
        delegate?.rightGameNumParent?.text = "\(set.numberOfGamesForTeamB)"
    }
    
    override func disablePointBtn(){
//        delegate?.point1BtnParent.isEnabled = false
//        delegate?.point2BtnParent.isEnabled = false
        delegate?.fault1BtnParent.isEnabled = false
        delegate?.fault2BtnParent.isEnabled = false
    }
    
    // フォルトボタンの非活性化
    override func disableFaultBtn(teamName:String){
        if teamName == "B"{
            delegate?.fault1BtnParent.isEnabled = false
            delegate?.fault2BtnParent.isEnabled = true
        }else{
            delegate?.fault1BtnParent.isEnabled = true
            delegate?.fault2BtnParent.isEnabled = false
        }
    }
    
    func createStackViewCell(convertedPoint:String) -> UIView {
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
        label.text = "\(convertedPoint)"
        label.sizeToFit()
        label.textColor = UIColor.black
        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView;
    }
    
    func createStackViewCell2(convertedPoint:String) -> UIView {
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
        label.text = "\(convertedPoint)"
        label.sizeToFit()
        label.textColor = UIColor.black
        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView;
    }
}
