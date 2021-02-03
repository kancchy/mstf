//
//  MatchController.swift
//  mstf
//
//  Created by 神田宗明 on 2021/01/20.
//

import UIKit

class MatchController: UIViewController {

    var argString = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player1.text = argString
    }

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var player2: UILabel!
    
    @IBOutlet weak var player3: UILabel!
    
    @IBOutlet weak var player4: UILabel!
    
}
