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
        
        super.player1NameParent = self.player1Name
        super.player2NameParent = self.player2Name
        super.player3NameParent = UILabel()
        super.player4NameParent = UILabel()
        super.clearBtnParent = self.clearBtn
        super.fault1BtnParent = UIButton()
        super.fault2BtnParent = UIButton()
        super.point1BtnParent = self.point1Btn
        super.point2BtnParent = self.point2Btn
        super.scoreParent = UILabel()
        super.team1NameParent = self.team1Name
        super.team2NameParent = self.team2Name
        super.team1StackViewParent = UIStackView()
        super.team2StackViewParent = UIStackView()
        
        super.viewDidLoad()
    }
    
    @IBAction func pushPoint1(_ sender: Any) {
        // プレゼンターの呼び出し
        presenter.scoredPoint(scoredTeam: "A")
        presenter.changeButtonLabel()
    }
    
    @IBAction func pushPoint2(_ sender: Any) {
        // プレゼンターの呼び出し
        presenter.scoredPoint(scoredTeam: "B")
        presenter.changeButtonLabel()
    }
    
    @IBAction func clearGamePoint(_ sender: Any) {
        // プレゼンターの呼び出し
        presenter.startNewGame(serverName:"")
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
    
    
}
