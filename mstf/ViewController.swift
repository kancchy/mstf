//
//  ViewController.swift
//  mstf
//
//  Created by 神田宗明 on 2021/01/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var makeMatch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var player1: UITextField!
    
    @IBOutlet weak var player2: UITextField!
    
    @IBOutlet weak var startDate: UIDatePicker!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segueの識別子確認
        if segue.identifier == "matchSegue" {

            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! MatchController;
            // 値の設定
            nextView.argString = player1.text!
            
            
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy/MM/dd"
            let strDate = dateformatter.string(from: startDate.date)
            print(strDate)
            
        }
    }
}

