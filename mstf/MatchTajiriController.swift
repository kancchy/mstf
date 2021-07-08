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
    
    @IBOutlet weak var leftSetNum: UILabel!
    @IBOutlet weak var rightSetNum: UILabel!
    
    override func viewDidLoad() {
        player1Name.text = inputPlayerName1;
        player2Name.text = inputPlayerName2;

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
        super.leftSetNumParent = self.leftSetNum
        super.rightSetNumParent = self.rightSetNum

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
    }
    
    @IBAction func pushFault1(_ sender: Any) {
        presenter.fault(faultTeam: "A")
    }
    
    @IBAction func pushFault2(_ sender: Any) {
        presenter.fault(faultTeam: "B")
        presenter.changeButtonLabel()
    }
    
    
}
