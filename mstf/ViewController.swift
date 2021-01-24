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
    
    @IBAction func goNextButton(_ sender: Any) {
        performSegue(withIdentifier: "matchIdentity", sender: nil)
    }


}

