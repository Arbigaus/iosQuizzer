//
//  PlayViewController.swift
//  Quizzer
//
//  Created by Gerson Arbrugaus on 01/03/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    let mainQuiz = Quiz.questions
    var quiz = [ Question ]()
    var right : Int = 0
    var randNumber : Int!
    var numberQuestion : Int = 1
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var buttonQuestionOneOutlet: UIButton!
    @IBOutlet weak var buttonQuestonTwoOutlet: UIButton!
    @IBOutlet weak var buttonQuestionTheeOutlet: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in self.mainQuiz {
            let c = i
            self.quiz.append(c)
        }
        
        self.createQuestion()
        
    }
    
    func createQuestion() {
        
        if self.quiz.count > 0 {
            let rand = Int.random(in: 0...self.quiz.count - 1)
            let question = quiz[rand]
            var answers  = [ String ]()
            answers.append(question.rightAnswer)
            
            for i in question.answer {
                answers.append(i)
            }
            
            self.randNumber = rand

            self.questionLabel.text = question.question
            
            var randAnswer = Int.random(in: 0...answers.count - 1)
            self.buttonQuestionOneOutlet.setTitle(answers[randAnswer], for: .normal)
            answers.remove(at: randAnswer)
            
            randAnswer = Int.random(in: 0...answers.count - 1)
            self.buttonQuestonTwoOutlet.setTitle(answers[randAnswer], for: .normal)
            answers.remove(at: randAnswer)

            self.buttonQuestionTheeOutlet.setTitle(answers[0], for: .normal)
            
            statusLabel.text = "Pergunta \(self.numberQuestion) / \(self.mainQuiz.count)"
            scoreLabel.text  = "Score: \(self.right)"
        
        } else {
            performSegue(withIdentifier: "goFinish", sender: self)
        }
        
    }
    
    // MARK: - Actions Buttons
    
    @IBAction func buttonQuestionOneAction(_ sender: Any) {
        if self.buttonQuestionOneOutlet.titleLabel?.text == self.quiz[self.randNumber!].rightAnswer {
            self.right += 1
        }
        self.quiz.remove(at: self.randNumber!)
        self.numberQuestion += 1
        self.createQuestion()
    }
    
    @IBAction func buttonQuestionTwoAction(_ sender: Any) {
        if self.buttonQuestonTwoOutlet.titleLabel?.text == self.quiz[self.randNumber!].rightAnswer {
            self.right += 1
        }
        self.quiz.remove(at: self.randNumber!)
        self.numberQuestion += 1
        self.createQuestion()
    }
    
    @IBAction func buttonQuestionThreeAction(_ sender: Any) {
        if self.buttonQuestionTheeOutlet.titleLabel?.text == self.quiz[self.randNumber!].rightAnswer {
            self.right += 1            
        }
        self.quiz.remove(at: self.randNumber!)
        self.numberQuestion += 1
        self.createQuestion()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "goFinish" {
            let finishView = segue.destination as! FinishViewController
            finishView.right = self.right
            
        }
        
    }
    
}
