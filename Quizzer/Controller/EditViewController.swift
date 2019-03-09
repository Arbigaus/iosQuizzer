//
//  EditViewController.swift
//  Quizzer
//
//  Created by Gerson Arbrugaus on 07/03/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    var index : Int? = nil
    var quiz = Quiz.questions
    var question : Question = Question()
    
    var activeField: UITextField?

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var rightAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var thirdAnswerTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForKeyboardNotifications()
        
        questionTextField.delegate = self
        rightAnswerTextField.delegate = self
        secondAnswerTextField.delegate = self
        thirdAnswerTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.index != nil {
            self.question = quiz[self.index!]
            questionTextField.text     = self.question.question
            rightAnswerTextField.text  = self.question.rightAnswer
            secondAnswerTextField.text = self.question.answer[0]
            thirdAnswerTextField.text  = self.question.answer[1]
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.index = nil
        self.question = Question()
        questionTextField.text     = ""
        rightAnswerTextField.text  = ""
        secondAnswerTextField.text = ""
        thirdAnswerTextField.text  = ""
    }
    
    @IBAction func saveAction(_ sender: Any) {
        self.question.question  = questionTextField.text!
        
        if self.index != nil {
            self.question.rightAnswer = rightAnswerTextField.text!
            self.question.answer[0]   = secondAnswerTextField.text!
            self.question.answer[1]   = thirdAnswerTextField.text!
            quiz[self.index!] = self.question
        } else {
            self.question.rightAnswer = rightAnswerTextField.text!
            self.question.answer.append(secondAnswerTextField.text!)
            self.question.answer.append(thirdAnswerTextField.text!)
            
            self.question.answer.remove(at: 0)
            
            Quiz.questions.append(self.question)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize!.height, right: 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        var info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyboardSize!.height, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        activeField = nil
    }
    
    

}
