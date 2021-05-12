//
//  SeguePresenter.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/02/24.
//

import Foundation
import UIKit

protocol DelegateProtocol {
    func dataSet()
}

extension DelegateProtocol{
    func dataSet(){
    }
}

class SeguePresenter:DelegateProtocol{
    var delegate:ViewController? = nil;
    var viewDetailDelegate:ViewDetailController? = nil;
    func dataSet(segue: UIStoryboardSegue){
        
//        var game:CurrentGame = CurrentGame.init();
        // Segueの識別子確認
        if segue.identifier == "viewDetail" {

            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! ViewDetailController;
            // 値の設定
            nextView.receivedPlayer1Name = (delegate?.player1.text!)!
            nextView.receivedPlayer2Name = (delegate?.player2.text!)!
            nextView.receivedPlayer3Name = (delegate?.player3.text!)!
            nextView.receivedPlayer4Name = (delegate?.player4.text!)!
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            nextView.startDate = dateformatter.string(from: (delegate?.startDate.date)!);

        } else if segue.identifier == "matchSegue" {

                // 遷移先ViewCntrollerの取得
                let nextView = segue.destination as! MatchController;
                // 値の設定
                nextView.player1Name = (delegate?.player1.text!)!
                nextView.player2Name = (delegate?.player2.text!)!
                nextView.player3Name = (delegate?.player3.text!)!
                nextView.player4Name = (delegate?.player4.text!)!
                
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy/MM/dd"
                nextView.date = dateformatter.string(from: (delegate?.startDate.date)!);
                
        } else if segue.identifier == "matchKanda" {

            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! MatchKandaController;
            // 値の設定
            nextView.receivedPlayer1Name = (delegate?.player1.text!)!
            nextView.receivedPlayer2Name = (delegate?.player2.text!)!
            nextView.receivedPlayer3Name = (delegate?.player3.text!)!
            nextView.receivedPlayer4Name = (delegate?.player4.text!)!
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            nextView.startDate = dateformatter.string(from: (delegate?.startDate.date)!);
            
        } else if segue.identifier == "matchTajiri" {

            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! MatchTajiriController;

            // 値の設定
            if delegate != nil{
                // ViewControllerからスコア集計画面に遷移するボタンが押された場合
                nextView.inputPlayerName1 = (delegate?.player1.text!)!
                nextView.inputPlayerName2 = (delegate?.player2.text!)!
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy/MM/dd"
                nextView.startDate = dateformatter.string(from: (delegate?.startDate.date)!);
            }else{
                // ViewDetailControllerからスコア集計画面に遷移するボタンが押された場合
                nextView.inputPlayerName1 = (viewDetailDelegate?.serverPlayerName.description)!
                print("セット数：" + (viewDetailDelegate?.playSetCount.description)!)
                print("ゲーム数：" + (viewDetailDelegate?.playGameCount.description)!)
            }
        } else if segue.identifier == "matchYamaguchi" {
            
            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! MatchYamaguchiController;

            // 値の設定
            if delegate != nil{
                // ViewControllerからスコア集計画面に遷移するボタンが押された場合
                nextView.inputPlayerName1 = (delegate?.player1.text!)!
                nextView.inputPlayerName2 = (delegate?.player2.text!)!
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy/MM/dd"
                nextView.startDate = dateformatter.string(from: (delegate?.startDate.date)!);
            }else{
                // ViewDetailControllerからスコア集計画面に遷移するボタンが押された場合
                nextView.inputPlayerName1 = (viewDetailDelegate?.receivedPlayer1Name.description)!
                nextView.inputPlayerName2 = (viewDetailDelegate?.receivedPlayer2Name.description)!
                nextView.inputPlayerName3 = (viewDetailDelegate?.receivedPlayer3Name.description)!
                nextView.inputPlayerName4 = (viewDetailDelegate?.receivedPlayer4Name.description)!
                nextView.serverTeamName = (viewDetailDelegate?.serverPlayerTeam.description)!
                print("セット数：" + (viewDetailDelegate?.playSetCount.description)!)
                print("ゲーム数：" + (viewDetailDelegate?.playGameCount.description)!)
            }
        }
    }
}
