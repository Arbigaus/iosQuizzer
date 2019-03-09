//
//  FinishViewController.swift
//  Quizzer
//
//  Created by Gerson Arbrugaus on 08/03/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
    
    var right : Int? = nil

    @IBOutlet weak var msgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        self.msgLabel.text = "Você acertou \(self.right!) perguntas"
        
    }
    
    
    @IBAction func restartButton(_ sender: Any) {
        self.back()
    }
    
    @objc func back() {
        let controller = self.navigationController?.viewControllers[0] // it is at index 1. index start from 0, 1 .. N
        self.navigationController?.popToViewController(controller!, animated: true)
    }
    

}
