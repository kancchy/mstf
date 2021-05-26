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
    var screenOperator:MatchScreenOperationsParentPresenter? = nil;
    var delegate:MatchParentController? = nil;
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
        screenOperator?.updatePoint(game:game);
    }
    
    func startNewSet(serverName:String){
        set = Set();        
        self.startNewGame(serverName:serverName)
        screenOperator?.addSetCount(serverName: serverName);
    }
    
    func startNewGame(serverName:String){
        game = Game();
        game.server = serverName
        screenOperator?.changeServerTeamBackgroundColor(serverName: serverName);
        
        hiddenFaultBtn()
        
        // セット内2ゲーム目までかどうかを判定し、2ゲーム以内ならばポップアップを出す
        if set.isDisplaySelectServerPopup(){
            // ポップアップ出す場合
            self.displayPopup(serverTeamName:serverName)
        }

    }
    
    // ポップアップを出す、引数にチーム名
    func displayPopup(serverTeamName:String){
        var serverPlayerName1 = ""
        var serverPlayerName2 = ""
        // setのポップアップを出すメソッドを呼ぶ
        if serverTeamName == "A"{
            serverPlayerName1 = delegate!.inputPlayerName1
            serverPlayerName2 = delegate!.inputPlayerName3
        }else{
            serverPlayerName1 = delegate!.inputPlayerName2
            serverPlayerName2 = delegate!.inputPlayerName4
        }
        displaySelectServerPopup(serverPlayerName1: serverPlayerName1,serverPlayerName2: serverPlayerName2)
    }
    
    func displaySelectServerPopup(serverPlayerName1:String,serverPlayerName2:String){
        // ① UIAlertControllerクラスのインスタンスを生成
        // タイトル, メッセージ, Alertのスタイルを指定する
        // 第3引数のpreferredStyleでアラートの表示スタイルを指定する
        let alert: UIAlertController = UIAlertController(title: "サーバー選択", message: "どなたがサーブを打ちますか？", preferredStyle:  UIAlertController.Style.alert)
        // ② Actionの設定
        // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
        // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
        // OKボタン（左）
        let defaultAction: UIAlertAction = UIAlertAction(title: serverPlayerName2, style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) -> Void in
            // ボタンが押された時の処理
            self.game.serverPlayerName = serverPlayerName2
        })
        // キャンセルボタン（右）
        let cancelAction: UIAlertAction = UIAlertAction(title: serverPlayerName1, style: UIAlertAction.Style.cancel, handler:{(action: UIAlertAction!) -> Void in
            // ボタンが押された時の処理を書く（クロージャ実装）
            self.game.serverPlayerName = serverPlayerName1
        })

        // ③ UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)

        // ④ Alertを表示
        delegate?.present(alert, animated: true, completion: nil)
    }

    func finishGame(){
        set.scored(game: game);
        print("set is finish:" + set.isFinish(teamName: game.findTheNameOfTheTeamThatGotTheGame()).description);
        
        // 画面にゲームを反映
        screenOperator?.updateGameCount(set:set);

        if set.isFinish(teamName: game.findTheNameOfTheTeamThatGotTheGame()) {
            score.scored(set: set);
            if score.isFinish(teamName: set.findTheNameOfTheTeamThatGotTheSet()){
                //試合終了
                score.finish();
                // TODO:試合終了ポップアップを出したい
                self.startNewSet(serverName:"")
            }else{
                self.startNewSet(serverName:score.getNextServerTeam())
            }
        }else{
            self.startNewGame(serverName:set.getNextServerTeam())
        }
    }
    
    func finishScore(){
        //試合終了
        score.finish();
        screenOperator?.disablePointBtn();
        
    }
    
    func fault(faultTeam: String){
        if game.activePoint.fault {
            // ポイント加算
            game.activePoint.scoredTeam = faultTeam == "A" ? "B" : "A"
            self.scoredPoint(scoredTeam: game.activePoint.scoredTeam)
            return
        }
        // フォルトフラグ真偽逆転
        game.activePoint.fault = true
    }
    
    // フォルトボタンの非活性化
    func hiddenFaultBtn(){
        if game.server == "B"{
            delegate?.faultBtnParent.isEnabled = false
        }
    }
}
