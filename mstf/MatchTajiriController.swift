//
//  MatchTajiriController.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/02/03.
//

import UIKit

class MatchTajiriController: MatchParentController {

    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var point1Btn: UIButton!
    @IBOutlet weak var point2Btn: UIButton!
    @IBOutlet weak var fault1Btn: UIButton!
    @IBOutlet weak var fault2Btn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    //var startDate = "";
    //var inputPlayerName1 = "";
    //var inputPlayerName2 = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1Name.text = inputPlayerName1;
        player2Name.text = inputPlayerName2;
        
        // 背景色
        self.point1Btn.backgroundColor = UIColor.yellow
        self.point2Btn.backgroundColor = UIColor.yellow
        self.fault1Btn.backgroundColor = UIColor.red
        self.fault2Btn.backgroundColor = UIColor.red
        self.clearBtn.backgroundColor = UIColor.systemPink
        
        // 角丸の程度を指定
        self.point1Btn.layer.cornerRadius = 20.0
        self.point2Btn.layer.cornerRadius = 20.0
        print(supportedInterfaceOrientations)

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
