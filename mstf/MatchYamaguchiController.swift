//
//  MatchYamaguchiController.swift
//  mstf
//
//  Created by 山口賢明 on 2021/03/03.
//

import UIKit

class MatchYamaguchiController: UIViewController {

    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player3Name: UILabel!
    @IBOutlet weak var player4Name: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var faulttn: UIButton!
    @IBOutlet weak var point1Btn: UIButton!
    @IBOutlet weak var point2Btn: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    
    @IBOutlet weak var team1StackView: UIStackView!
    @IBOutlet weak var team2StackView: UIStackView!
    /// 作成したViewのカウンター
    var count:Int = 0
    
    // プレゼンターの初期化
    let presenter = MatchPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // headerのBackが重ならなくなる
        edgesForExtendedLayout = []
        presenter.delegate = self
        print(supportedInterfaceOrientations)
//        presenter.startNewSet()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushPoint1(_ sender: Any) {
        // プレゼンターの呼び出し
        presenter.scoredPoint(scoredTeam: "A")
        presenter.changeButtonLabel()
        // stackViewにnewViewを追加する
        team1StackView.addArrangedSubview(createStackViewCell())

        team2StackView.addArrangedSubview(createStackViewCell2())
    }
    
    @IBAction func pushPoint2(_ sender: Any) {
        // プレゼンターの呼び出し
        presenter.scoredPoint(scoredTeam: "B")
        presenter.changeButtonLabel()
        
        // stackViewにnewViewを追加する
        team1StackView.addArrangedSubview(createStackViewCell())

        team2StackView.addArrangedSubview(createStackViewCell2())
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clearGamePoint(_ sender: Any) {
        // プレゼンターの呼び出し
        presenter.startNewGame()
        presenter.changeButtonLabel()
    }
    
    @IBAction func pushFault1(_ sender: Any) {
        presenter.fault(faultTeam: "A")
        presenter.changeButtonLabel()
    }
    
    @IBAction func pushFault2(_ sender: Any) {
        presenter.fault(faultTeam: "B")
        presenter.changeButtonLabel()
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
        label.text = "\(count)"
        label.sizeToFit()
        label.textColor = UIColor.black
        // ナンバリング用のカウンタをインクリメント
        count += 1
        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView;
    }
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        //左横画面に変更
        if(UIDevice.current.orientation.rawValue == 4){
            UIDevice.current.setValue(4, forKey: "orientation")
            return .landscapeLeft
        }
        //左横画面以外の処理
        else {
            //最初の画面呼び出しで画面を右横画面に変更させる。
            UIDevice.current.setValue(3, forKey: "orientation")
            return .landscapeRight
        }
    }

    // 画面を自動で回転させるかを決定する。
    override var shouldAutorotate: Bool {
        //画面が縦だった場合は回転させない
        if(UIDevice.current.orientation.rawValue == 1){
            print(supportedInterfaceOrientations)
            return false
        }
        else{
            return true
        }
    }
}
