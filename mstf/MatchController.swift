//
//  MatchController.swift
//  mstf
//
//  Created by 神田宗明 on 2021/01/20.
//

import UIKit

class MatchController: UIViewController {

    var player1Name = "";
    var player2Name = "";
    var player3Name = "";
    var player4Name = "";
    var date = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player1.text = player1Name
        player2.text = player2Name
        player3.text = player3Name
        player4.text = player4Name
        dateLabel.text = date
    }

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var player2: UILabel!
    
    @IBOutlet weak var player3: UILabel!
    
    @IBOutlet weak var player4: UILabel!
    
}
