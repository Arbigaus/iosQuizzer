//
//  Quiz.swift
//  Quizzer
//
//  Created by Gerson Arbrugaus on 01/03/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import Foundation
class Quiz {
    static var questions = [ Question ]()
    
    init() {
        
    }
    
    public func setStartQuiz(){
        let question1 = Question()
        question1.question = "Quais filmes ganharam 11 Oscars?"
        question1.rightAnswer = "LOTR e Titanic"
        question1.answer = [ "Fight Club", "Hobbit" ]
        
        Quiz.questions.append(question1)
        
        let question2 = Question()
        question2.question = "Qual o jogo ganhou como o melhor de 2018?"
        question2.rightAnswer = "GOW 4"
        question2.answer = [ "RDR2", "GTA5" ]
        
        Quiz.questions.append(question2)
        
        let question3 = Question()
        question3.question = "Que filme levou o Oscar de melhor ator em 2019?"
        question3.rightAnswer = "Bohemian Rapsody"
        question3.answer = [ "ROMA", "Nasce uma Estrela" ]
        
        Quiz.questions.append(question3)
        
        let question4 = Question()
        question4.question = "Qual a data do DIA D na Segunda Guerra Mundial?"
        question4.rightAnswer = "06/Jun/1964"
        question4.answer = [ "06/Jun/1965", "25/Mai/1964" ]
        
        Quiz.questions.append(question4)
    }
    
    func removeQuiz(index: Int) {
        Quiz.questions.remove(at: index)
        print(Quiz.questions)
    }
}

