//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
               Question(q: "Tania is a Barista.", a: "True"),
               Question(q: "Tania started learning swift from 2023.", a: "True"),
               Question(q: "The ios app class starts from March 6th.", a: "True"),
               Question(q: " 3 + 3 = 6 ", a: "True"),
               Question(q: "I'm 20 years old.", a: "False"),
               Question(q: "I have no coding background.", a: "True"),
               Question(q: "Tania doesn't have a laptop.", a: "False"),
               Question(q: "Udemy is a nice website for self learner.", a: "True"),
               Question(q: "I still can not type without looking at keyboard.", a: "True"),
               Question(q: "I eat 2 meals a day.", a: "False"),
               Question(q: "This quiz ends here.", a: "False"),
               Question(q: "This is the last question.", a: "True")

       ]
    
    var questionNUmber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNUmber].answer
        
        if userAnswer == actualAnswer{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        if questionNUmber + 1 < quiz.count {
            questionNUmber += 1
            print(questionNUmber)
        }else{
            questionNUmber = 0
        }
     
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
               
    
    }
    
    @objc func updateUI(){
        questionLabel.text = quiz[questionNUmber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        progressBar.progress = Float(questionNUmber + 1)/Float(quiz.count)
        //問題數從0開始，但是0除以數量等於0 進度條會沒有顏色，所以要＋１
    }
}



