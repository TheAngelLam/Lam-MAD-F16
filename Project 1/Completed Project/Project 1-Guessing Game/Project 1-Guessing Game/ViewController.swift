//
//  ViewController.swift
//  Project 1-Guessing Game
//
//  Created by Angel Lam on 10/8/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var roundOne = ["answer":"fox", "images":["fox-1.png", "fox-2.png", "fox-3.png", "fox-full_image.png"]]
    var roundTwo = ["answer":"bear", "images":["bear-1.png", "bear-2.png", "bear-3.png", "bear-full_image.png"]]
    var roundThree = ["answer":"turtle", "images":["turtle-1.png", "turtle-2.png", "turtle-3.png", "turtle-full_image.png"]]

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var roundNumberLabel: UILabel!
    @IBOutlet weak var cluesButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var aboveSubmitTextLabel: UILabel!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        answerTextField.resignFirstResponder()
    }
    
    var roundOver = false
    var roundNumber = 1
    var roundCount = 0
    var numButtonPresses = 0
    
    //Round Number Text
    func roundNumberLabelText(roundLabel:Int) {
        if (roundLabel) == 1 {
            roundNumberLabel.text = "Round 1"
        } else if (roundLabel) == 2 {
            roundNumberLabel.text = "Round 2"
        } else {
            roundNumberLabel.text = "Round 3"
        }
    }
    
    //Associate round number with dictionary
    func imageNamesForRound(round:Int) -> [String] {
        if (round) == 1 {
            return roundOne["images"] as! [String]
        } else if round == 2 {
            return roundTwo["images"] as! [String]
        } else if round == 3 {
            return roundThree["images"] as! [String]
        } else {
            return []
        }
    }
    
    //Clues Button
    @IBAction func cluesButton(sender: UIButton) {
        numButtonPresses = (numButtonPresses + 1) % 3
        
        //Round One
        if (numButtonPresses == 0 && roundNumber == 1) {
            let firstImageName = imageNamesForRound(1)[0]
            animalImage.image = UIImage(named: firstImageName)
        } else if (numButtonPresses == 1 && roundNumber == 1)  {
            let secondImageName = imageNamesForRound(1)[1]
            animalImage.image = UIImage(named: secondImageName)
        } else if (numButtonPresses == 2 && roundNumber == 1) {
            let thirdImageName = imageNamesForRound(1)[2]
            animalImage.image = UIImage(named: thirdImageName)
        }
        
        //Round Two
        if (numButtonPresses == 0 && roundNumber == 2) {
            let firstImageName = imageNamesForRound(2)[0]
            animalImage.image = UIImage(named: firstImageName)
        } else if (numButtonPresses == 1 && roundNumber == 2)  {
            let secondImageName = imageNamesForRound(2)[1]
            animalImage.image = UIImage(named: secondImageName)
        } else if (numButtonPresses == 2 && roundNumber == 2) {
            let thirdImageName = imageNamesForRound(2)[2]
            animalImage.image = UIImage(named: thirdImageName)
        }
        
        //Round Three
        if (numButtonPresses == 0 && roundNumber == 3) {
            let firstImageName = imageNamesForRound(3)[0]
            animalImage.image = UIImage(named: firstImageName)
        } else if (numButtonPresses == 1 && roundNumber == 3) {
            let secondImageName = imageNamesForRound(3)[1]
            animalImage.image = UIImage(named: secondImageName)
        } else if (numButtonPresses == 2 && roundNumber == 3) {
            let thirdImageName = imageNamesForRound(3)[2]
            animalImage.image = UIImage(named: thirdImageName)
        }
        
        //Reset screen
        //If Next Level is pressed
//        check to see what title is: cluesButton.titleForState(.Normal) == "Next Level"
        //Go to Round Two
        if (roundOver == true && roundNumber == 1) {
            roundOver = false
            numButtonPresses = 0
            roundNumber = 2
            roundNumberLabelText(2)
            let firstImageName = imageNamesForRound(2)[0]
            animalImage.image = UIImage(named: firstImageName)
            cluesButton.setTitle("Clue", forState: .Normal)
            aboveSubmitTextLabel.text = "What's your guess?"
            answerTextField.hidden = false
            submitButton.hidden = false
            answerTextField.text = ""
        }
        
        //Go to Round Three
        if (roundOver == true && roundNumber == 2) {
            roundOver = false
            numButtonPresses = 0
            roundNumber = 3
            roundNumberLabelText(3)
            let firstImageName = imageNamesForRound(3)[0]
            animalImage.image = UIImage(named: firstImageName)
            cluesButton.setTitle("Clue", forState: .Normal)
            aboveSubmitTextLabel.text = "What's your guess?"
            answerTextField.hidden = false
            submitButton.hidden = false
            answerTextField.text = ""
        }
        
        //Play Again
        if (cluesButton.titleForState(.Normal) == "Play Again" && roundNumber == 3) {
            roundOver = false
            numButtonPresses = 0
            roundNumber = 1
            roundCount = 0
            roundNumberLabelText(1)
            let firstImageName = imageNamesForRound(1)[0]
            animalImage.image = UIImage(named: firstImageName)
            cluesButton.setTitle("Clue", forState: .Normal)
            aboveSubmitTextLabel.text = "What's your guess?"
            answerTextField.hidden = false
            submitButton.hidden = false
            answerTextField.text = ""
        }
    }
    
    //Submit Button
    @IBAction func submitButton(sender: UIButton) {
        numButtonPresses = (numButtonPresses + 1) % 4
        let userAnswer = answerTextField.text?.lowercaseString
        
        //Round One
        if (numButtonPresses <= 3 && roundNumber == 1 && userAnswer?.characters.count != 0 && userAnswer == "fox") {
            let fourthImageName = imageNamesForRound(1)[3]
            animalImage.image = UIImage(named: fourthImageName)
            
            cluesButton.setTitle("Next Level", forState: .Normal)
            answerTextField.hidden = true
            submitButton.hidden = true
            aboveSubmitTextLabel.text = "You guessed right!"
            roundOver = true
            roundCount += 1
            answerTextField.resignFirstResponder()
        } else if (numButtonPresses < 3 && roundNumber == 1 && userAnswer?.characters.count != 0 && userAnswer != "fox") {
            aboveSubmitTextLabel.text = "Guess again!"
        } else if (numButtonPresses == 3 && roundNumber == 1 && userAnswer?.characters.count != 0 && userAnswer != "fox") {
            let fourthImageName = imageNamesForRound(1)[3]
            animalImage.image = UIImage(named: fourthImageName)
            
            cluesButton.setTitle("Next Level", forState: .Normal)
            answerTextField.hidden = true
            submitButton.hidden = true
            aboveSubmitTextLabel.text = "You guessed wrong! \nThe answer is \"Fox.\""
            roundOver = true
            answerTextField.resignFirstResponder()
        }
        
        //Round Two
        if (numButtonPresses <= 3 && roundNumber == 2 && userAnswer?.characters.count != 0 && userAnswer == "bear") {
            let fourthImageName = imageNamesForRound(2)[3]
            animalImage.image = UIImage(named: fourthImageName)
            
            cluesButton.setTitle("Next Level", forState: .Normal)
            answerTextField.hidden = true
            submitButton.hidden = true
            aboveSubmitTextLabel.text = "You guessed right!"
            roundOver = true
            roundCount += 1
            answerTextField.resignFirstResponder()
        } else if (numButtonPresses < 3 && roundNumber == 2 && userAnswer?.characters.count != 0 && userAnswer != "bear") {
            aboveSubmitTextLabel.text = "Guess again!"
        }
        else if (numButtonPresses == 3 && roundNumber == 2 && userAnswer?.characters.count != 0 && userAnswer != "bear") {
            let fourthImageName = imageNamesForRound(2)[3]
            animalImage.image = UIImage(named: fourthImageName)
            
            cluesButton.setTitle("Next Level", forState: .Normal)
            answerTextField.hidden = true
            submitButton.hidden = true
            aboveSubmitTextLabel.text = "You guessed wrong! \nThe answer is \"Bear.\""
            roundOver = true
            answerTextField.resignFirstResponder()
        }
        
        //Round Three
        if (numButtonPresses <= 3 && roundNumber == 3 && userAnswer?.characters.count != 0 && userAnswer == "turtle") {
            let fourthImageName = imageNamesForRound(3)[3]
            animalImage.image = UIImage(named: fourthImageName)
            
            cluesButton.setTitle("Play Again", forState: .Normal)
            answerTextField.hidden = true
            submitButton.hidden = true
            roundCount += 1
            aboveSubmitTextLabel.text = "You guessed right! \nYou got \(roundCount) out of 3 rounds correct."
            roundOver = true
            answerTextField.resignFirstResponder()
        } else if (numButtonPresses < 3 && roundNumber == 3 && userAnswer?.characters.count != 0 && userAnswer != "turtle") {
            aboveSubmitTextLabel.text = "Guess again!"
        }
        else if (numButtonPresses == 3 && roundNumber == 3 && userAnswer?.characters.count != 0 && userAnswer != "turtle") {
            let fourthImageName = imageNamesForRound(3)[3]
            animalImage.image = UIImage(named: fourthImageName)

            cluesButton.setTitle("Play Again", forState: .Normal)
            answerTextField.hidden = true
            submitButton.hidden = true
            aboveSubmitTextLabel.text = "You guessed wrong! \nThe answer is \"Turtle.\" You got \(roundCount) out of 3 rounds correct."
            roundOver = true
            answerTextField.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        roundNumberLabelText(1)
        answerTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

