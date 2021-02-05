//
//  MatchKandaController.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/02/03.
//

import UIKit

class MatchKandaController: UIViewController {

    var player1Name = "";
    var player2Name = "";
    var player3Name = "";
    var player4Name = "";
    var startDate = "";
    
    var player1sPoint = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        player1.text = player1Name;
        player2.text = player2Name;
        player3.text = player3Name;
        player4.text = player4Name;
        print("startDate:" + startDate)
    }
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player3: UILabel!
    @IBOutlet weak var player4: UILabel!
    @IBOutlet weak var leftGameNum: UILabel!
    @IBOutlet weak var rightGameNum: UILabel!
    @IBOutlet weak var leftSetNum: UILabel!
    @IBOutlet weak var rightSetNum: UILabel!
    
    @IBAction func tapLeftView(_ sender: Any) {
        print("tap Left View")
    }
    @IBAction func tapRightView(_ sender: Any) {
        print("tap Right View")
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
