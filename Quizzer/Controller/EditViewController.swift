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
    
    var keyboardUp : Int? = nil
    
    var activeField: UITextField?

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var rightAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var thirdAnswerTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        self.hideKeyboardWhenTappedAround()
        
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
    
    @objc func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
}
