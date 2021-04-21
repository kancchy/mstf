//
//  ViewController.swift
//  mstf
//
//  Created by 神田宗明 on 2021/01/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var makeMatch: UIButton!
    
    // プレゼンターの初期化
    let present = SeguePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        present.delegate = self
    }
    
    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    @IBOutlet weak var player3: UITextField!
    @IBOutlet weak var player4: UITextField!
    
    @IBOutlet weak var startDate: UIDatePicker!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // データの受け渡し
        present.dataSet(segue: segue)
    }
}

