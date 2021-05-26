//
//  MatchYamaguchiController.swift
//  mstf
//
//  Created by 山口賢明 on 2021/03/03.
//

import UIKit

class MatchYamaguchiController: MatchParentController {

    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player3Name: UILabel!
    @IBOutlet weak var player4Name: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var fault1Btn: UIButton!
    @IBOutlet weak var fault2Btn: UIButton!
    @IBOutlet weak var point1Btn: UIButton!
    @IBOutlet weak var point2Btn: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    
    @IBOutlet weak var team1StackView: UIStackView!
    @IBOutlet weak var team2StackView: UIStackView!

    /// 作成したViewのカウンター
    var count:Int = 0
        
    override func viewDidLoad() {
        player1Name.text = inputPlayerName1;
        player2Name.text = inputPlayerName2;
        player3Name.text = inputPlayerName3;
        player4Name.text = inputPlayerName4;
        print("serverTeamName: " + serverTeamName)
    
        print(supportedInterfaceOrientations)

        super.player1NameParent = self.player1Name
        super.player2NameParent = self.player2Name
        super.player3NameParent = self.player3Name
        super.player4NameParent = self.player4Name
        super.clearBtnParent = self.clearBtn
        super.fault1BtnParent = self.fault1Btn
        super.fault2BtnParent = self.fault2Btn
        super.point1BtnParent = self.point1Btn
        super.point2BtnParent = self.point2Btn
        super.scoreParent = self.score
        super.team1NameParent = self.team1Name
        super.team2NameParent = self.team2Name
        super.team1StackViewParent = self.team1StackView
        super.team2StackViewParent = self.team2StackView

        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
