//
//  ViewController.swift
//  Quizzer
//
//  Created by Gerson Arbrugaus on 27/02/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let quiz = Quiz.questions
        let startQuiz = Quiz()
        
        if quiz.count == 0 {
            startQuiz.setStartQuiz()
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
