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
    // プレゼンターの初期化
    let presenter = MatchPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.startNewSet()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushPoint1(_ sender: Any) {
        print("pushPoint1")
        // プレゼンターの呼び出し
        presenter.scoredPoint(scoredTeam: "A")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
