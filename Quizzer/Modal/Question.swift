//
//  Question.swift
//  Quizzer
//
//  Created by Gerson Arbrugaus on 01/03/19.
//  Copyright © 2019 Arbigaus. All rights reserved.
//

import Foundation

class Question {

    var question    : String
    var rightAnswer : String
    var answer      : [ String ]
    
    init() {
        self.question    = ""
        self.rightAnswer = ""
        self.answer      = [ "" ]
    }
}
