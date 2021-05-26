//
//  MatchController.swift
//  mstf
//
//  Created by 神田宗明 on 2021/01/20.
//

import UIKit

class MatchParentController: UIViewController {

//    var player1Name = "";
//    var player2Name = "";
//    var player3Name = "";
//    var player4Name = "";
    var player1NameParent: UILabel!
    var player2NameParent: UILabel!
    var player3NameParent: UILabel!
    var player4NameParent: UILabel!
    var clearBtnParent: UIButton!
    var faultBtnParent: UIButton!
    var point1BtnParent: UIButton!
    var point2BtnParent: UIButton!
    var scoreParent: UILabel!
    var team1NameParent: UILabel!
    var team2NameParent: UILabel!
    
    var team1StackViewParent: UIStackView!
    var team2StackViewParent: UIStackView!

    var startDate = "";
    var inputPlayerName1 = "";
    var inputPlayerName2 = "";
    var inputPlayerName3 = "";
    var inputPlayerName4 = "";
    var serverTeamName = "";
    var serverPlayerName1 = "";
    var serverPlayerName2 = "";
    var date = "";
    
    // プレゼンターの初期化
    let presenter = MatchPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        player1.text = player1Name
//        player2.text = player2Name
//        player3.text = player3Name
//        player4.text = player4Name
        //dateLabel.text = date
        
        // headerのBackが重ならなくなる
        edgesForExtendedLayout = []
        
        presenter.delegate = self
        presenter.startNewSet(serverName:serverTeamName)
    }

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var player2: UILabel!
    
    @IBOutlet weak var player3: UILabel!
    
    @IBOutlet weak var player4: UILabel!
    
}
