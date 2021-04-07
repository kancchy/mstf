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
    var delegete:ViewController? = nil;
    func dataSet(segue: UIStoryboardSegue){
        
//        var game:CurrentGame = CurrentGame.init();
        // Segueの識別子確認
        if segue.identifier == "matchSegue" {

            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! MatchController;
            // 値の設定
            nextView.player1Name = (delegete?.player1.text!)!
            nextView.player2Name = (delegete?.player2.text!)!
            nextView.player3Name = (delegete?.player3.text!)!
            nextView.player4Name = (delegete?.player4.text!)!
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            nextView.date = dateformatter.string(from: (delegete?.startDate.date)!);
            
        } else if segue.identifier == "matchKanda" {

            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! MatchKandaController;
            // 値の設定
            nextView.receivedPlayer1Name = (delegete?.player1.text!)!
            nextView.receivedPlayer2Name = (delegete?.player2.text!)!
            nextView.receivedPlayer3Name = (delegete?.player3.text!)!
            nextView.receivedPlayer4Name = (delegete?.player4.text!)!
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            nextView.startDate = dateformatter.string(from: (delegete?.startDate.date)!);
            
        } else if segue.identifier == "matchTajiri" {

            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! MatchTajiriController;

            // 値の設定
            //nextView.player1Name.text? = (delegete?.player1.text!)!
            //nextView.player2Name.text? = (delegete?.player2.text!)!

            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            nextView.startDate = dateformatter.string(from: (delegete?.startDate.date)!);
        }
    }
}
