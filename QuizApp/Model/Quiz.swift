//
//  Quiz.swift
//  QuizApp
//
//  Created by Michel Bernardo on 01/06/21.
//  Copyright © 2021 Gwinyai. All rights reserved.
//

import UIKit

struct QuizQuestion {
    
    var correctAnswer: Bool
    var question: String
    var image: UIImage
}

class Quiz {
    
    //MARK: Properties
    private var questions: [QuizQuestion] = [
        QuizQuestion(correctAnswer: true, question: "Is this a tree?", image: UIImage(named: "tree")!),
        QuizQuestion(correctAnswer: false, question: "Is this a dog?", image: UIImage(named: "car")!),
        QuizQuestion(correctAnswer: false, question: "Is this a person?", image: UIImage(named: "mug")!),
        QuizQuestion(correctAnswer: true, question: "Is this a dog?", image: UIImage(named: "dog")!),
        QuizQuestion(correctAnswer: false, question: "Is this a bottle of soda?", image: UIImage(named: "bottle")!),
        QuizQuestion(correctAnswer: true, question: "Is this a fashion car?", image: UIImage(named: "oldcar")!),
        QuizQuestion(correctAnswer: true, question: "Is this a girl eating pizza?", image: UIImage(named: "pizza")!),
        QuizQuestion(correctAnswer: true, question: "Is this a beach?", image: UIImage(named: "beach")!),
        QuizQuestion(correctAnswer: false, question: "Is this a watch?", image: UIImage(named: "notebook")!),
        QuizQuestion(correctAnswer: false, question: "Is this a waterfall?", image: UIImage(named: "subway")!)
    ]
    
    private var score: Int = 0
    private var questionIndex: Int = 0
    
    //MARK: Methods
    func getScore() -> String {
        return "\(score) \\ \(questions.count)"
    }
    
    func getQuestion() -> QuizQuestion {
        return questions[questionIndex]
    }
    
    func check(answer: Bool) -> Bool {
        let question = getQuestion()
        
        if question.correctAnswer == answer {
            score += 1
            return true
        }
        
        return false
    }
    
    func nextQuestion() -> Bool {
        questionIndex += 1
        
        if questionIndex > questions.count - 1 {
            return false
        }
        
        return true
    }
    
    func reset() {
        questionIndex = 0
        score = 0
    }
}
