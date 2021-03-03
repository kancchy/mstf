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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.point1Btn.backgroundColor = UIColor.yellow
        self.point2Btn.backgroundColor = UIColor.yellow
        //角丸の程度を指定
        self.point1Btn.layer.cornerRadius = 20.0
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
