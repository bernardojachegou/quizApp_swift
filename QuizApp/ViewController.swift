//
//  ViewController.swift
//  QuizApp
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
    }
    
    @IBAction func trueButtonDidTouch(_ sender: Any) {
        let result = quiz.check(answer: true)
        showResult(isCorrect: result)
    }
    
    
    @IBAction func falseButtonDidTouch(_ sender: Any) {
        let result = quiz.check(answer: false)
        showResult(isCorrect: result)
    }
    
    func setupQuestion() {
        let currentQuestion = quiz.getQuestion()
        questionImage.image = currentQuestion.image
        questionLabel.text = currentQuestion.question
    }
    
    func showResult(isCorrect correct: Bool) {
        
        let title = correct ? "Correct" : "Incorrect"
        let message = correct ? "You got the right answer!" : "You got the wrong answer!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let nextQuestionAction = UIAlertAction(title: "Next Question", style: .default) { (action) in
            if self.quiz.nextQuestion() {
                self.setupQuestion()
                alert.dismiss(animated: true, completion: nil)
            } else {
                alert.dismiss(animated: true, completion: nil)
                self.showFinalScore()
            }
        }
        
        alert.addAction(nextQuestionAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFinalScore() {
        let alert = UIAlertController(title: "Final Score", message: quiz.getScore(), preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.quiz.reset()
            self.setupQuestion()
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

