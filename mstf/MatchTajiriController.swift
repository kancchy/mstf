//
//  MatchTajiriController.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/02/03.
//

import UIKit

class MatchTajiriController: UIViewController {

    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var point1Btn: UIButton!
    @IBOutlet weak var point2Btn: UIButton!
    @IBOutlet weak var fault1Btn: UIButton!
    @IBOutlet weak var fault2Btn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    var startDate = "";
    var inputPlayerName1 = "";
    var inputPlayerName2 = "";
    
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
