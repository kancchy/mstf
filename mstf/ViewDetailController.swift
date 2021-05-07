//
//  ViewDetailController.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/04/28.
//

import UIKit

class ViewDetailController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var dateOutput: UILabel!
    @IBOutlet weak var playerNameOutput1: UIButton!
    @IBOutlet weak var playerNameOutput2: UIButton!
    @IBOutlet weak var playerNameOutput3: UIButton!
    @IBOutlet weak var playerNameOutput4: UIButton!
    @IBOutlet weak var setSelect: UIPickerView!
    @IBOutlet weak var gameSelect: UIPickerView!
    
    // 前画面から引き継いだデータ
    var receivedPlayer1Name = "";
    var receivedPlayer2Name = "";
    var receivedPlayer3Name = "";
    var receivedPlayer4Name = "";
    var startDate = "";
    
    // この画面で選択したデータ
    var serverPlayerName = "";
    var playSetCount = 0;
    var playGameCount = 0;
    
    // プレゼンターの初期化
    let present = SeguePresenter()
    
    // UIPicker関連
    let setList = [1,3,5]
    let gameList = [1,2,6]
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return setList.count
        }else{
            return gameList.count
        }
    }
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return setList[row].description
        }else{
            return gameList[row].description
        }
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        if pickerView.tag == 1{
            playSetCount = setList[row]
        }else{
            playGameCount = gameList[row]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        present.viewDetailDelegate = self
        
        // UIPickerViewの設定(セット数)
        setSelect.delegate = self
        setSelect.dataSource = self
        setSelect.tag = 1
        // UIPickerViewの設定(ゲーム数)
        gameSelect.delegate = self
        gameSelect.dataSource = self
        gameSelect.tag = 2
        
        // 前の画面からのデータ引き継ぎ
        dateOutput.text = startDate
        playerNameOutput1.setTitle(receivedPlayer1Name, for: .normal)
        playerNameOutput2.setTitle(receivedPlayer2Name, for: .normal)
        playerNameOutput3.setTitle(receivedPlayer3Name, for: .normal)
        playerNameOutput4.setTitle(receivedPlayer4Name, for: .normal)
    }
    
    @IBAction func pushButton1(_ sender: Any) {
        clearColor()
        // プレイヤー1をサーバーに
        serverPlayerName = "1"
        playerNameOutput1.backgroundColor = UIColor.red
    }
    
    @IBAction func pushButton2(_ sender: Any) {
        clearColor()
        // プレイヤー2をサーバーに
        serverPlayerName = "2"
        playerNameOutput2.backgroundColor = UIColor.red
    }
    
    @IBAction func pushButton3(_ sender: Any) {
        clearColor()
        // プレイヤー3をサーバーに
        serverPlayerName = "3"
        playerNameOutput3.backgroundColor = UIColor.red
    }
    
    @IBAction func pushButton4(_ sender: Any) {
        clearColor()
        // プレイヤー4をサーバーに
        serverPlayerName = "4"
        playerNameOutput4.backgroundColor = UIColor.red
    }
    
    func clearColor(){
        playerNameOutput1.backgroundColor = UIColor.white
        playerNameOutput2.backgroundColor = UIColor.white
        playerNameOutput3.backgroundColor = UIColor.white
        playerNameOutput4.backgroundColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // データの受け渡し
        present.dataSet(segue: segue)
    }
}
