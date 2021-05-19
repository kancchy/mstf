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
    
    func startNewSet(serverName:String){
        set = Set();        
        self.startNewGame(serverName:serverName)
        // stackViewにnewViewを追加する
        delegate?.team1StackView.addArrangedSubview(createStackViewCell())
        delegate?.team2StackView.addArrangedSubview(createStackViewCell2())
    }
    
    func startNewGame(serverName:String){
        game = Game();
        game.server = serverName
        
        // 仮：サーバーチームを色変え
        if serverName == "A"{
            delegate?.player1Name.backgroundColor = UIColor.red
            delegate?.player3Name.backgroundColor = UIColor.red
            delegate?.player2Name.backgroundColor = UIColor.clear
            delegate?.player4Name.backgroundColor = UIColor.clear
        }else{
            delegate?.player2Name.backgroundColor = UIColor.red
            delegate?.player4Name.backgroundColor = UIColor.red
            delegate?.player1Name.backgroundColor = UIColor.clear
            delegate?.player3Name.backgroundColor = UIColor.clear
        }
        
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
          // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: serverPlayerName2, style: UIAlertAction.Style.default, handler:{
              // ボタンが押された時の処理を書く（クロージャ実装）
              (action: UIAlertAction!) -> Void in
          })
          // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: serverPlayerName1, style: UIAlertAction.Style.cancel, handler:{
              // ボタンが押された時の処理を書く（クロージャ実装）
              (action: UIAlertAction!) -> Void in
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
        var nowSet:UIView?  = delegate?.team1StackView.subviews.last
        var testLabel: UILabel?  = nowSet!.subviews.first as? UILabel
        testLabel?.text = "\(set.numberOfGamesForTeamA)"
        nowSet = delegate?.team2StackView.subviews.last
        testLabel  = nowSet!.subviews.first as? UILabel
        testLabel?.text = "\(set.numberOfGamesForTeamB)"
        
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
        // フォルトフラグ真偽逆転
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
