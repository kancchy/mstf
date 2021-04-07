//
//  MatchKandaController.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/02/03.
//

import UIKit

class MatchKandaController: UIViewController {

    var receivedPlayer1Name = "";
    var receivedPlayer2Name = "";
    var receivedPlayer3Name = "";
    var receivedPlayer4Name = "";
    var startDate = "";
    
    var player1sPoint = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        player1Name.text = receivedPlayer1Name;
        player2Name.text = receivedPlayer2Name;
        player3Name.text = receivedPlayer3Name;
        player4Name.text = receivedPlayer4Name;
        print("startDate:" + startDate)
    }
    
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player3Name: UILabel!
    @IBOutlet weak var player4Name: UILabel!
    
    @IBOutlet weak var leftGameNum: UILabel!
    @IBOutlet weak var rightGameNum: UILabel!
    @IBOutlet weak var leftSetNum: UILabel!
    @IBOutlet weak var rightSetNum: UILabel!
    
    @IBOutlet weak var leftGameLine: UIStackView!
    @IBOutlet weak var rightGameLine: UIStackView!
    /// 作成したViewのカウンター
    var count:Int = 0
    
    
    @IBAction func tapLeftView(_ sender: Any) {
        print("tap Left View")
        // stackViewにnewViewを追加する
        leftGameLine.addArrangedSubview(createStackViewCell())

        rightGameLine.addArrangedSubview(createStackViewCell2())
        
    }
    @IBAction func tapRightView(_ sender: Any) {
        print("tap Right View")
        leftGameLine.addArrangedSubview(createStackViewCell())

        rightGameLine.addArrangedSubview(createStackViewCell2())
        
    }
    
    @IBAction func pushFoultBtn(_ sender: Any) {
        print("tap Btn")

        // stackViewにnewViewを追加する
        leftGameLine.addArrangedSubview(createStackViewCell())

        rightGameLine.addArrangedSubview(createStackViewCell2())
    }
    
    @IBAction func tapLeftFirstBtn(_ sender: Any) {
        leftGameLine.addArrangedSubview(createStackViewCell())

        rightGameLine.addArrangedSubview(createStackViewCell2())
    }
    
    @IBAction func tapRightFirstBtn(_ sender: Any) {

        rightGameLine.addArrangedSubview(createStackViewCell2())

        leftGameLine.addArrangedSubview(createStackViewCell())
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
        label.text = "\(count)"
        label.sizeToFit()
        label.textColor = UIColor.black
        // ナンバリング用のカウンタをインクリメント
        count += 1
        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
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
        label.text = "\(count)"
        label.sizeToFit()
        label.textColor = UIColor.black
        // ナンバリング用のカウンタをインクリメント
        count += 1
        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView;
    }

}
