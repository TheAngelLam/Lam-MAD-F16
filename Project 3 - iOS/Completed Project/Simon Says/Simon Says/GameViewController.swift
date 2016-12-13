//
//  GameViewController.swift
//  Simon Says
//
//  Created by Angel Lam on 12/8/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var yellowButton:UIButton!
    @IBOutlet weak var blueButton:UIButton!
    @IBOutlet weak var redButton:UIButton!
    @IBOutlet weak var greenButton:UIButton!
    @IBOutlet weak var inGameRoundCountLabel: UILabel!
    
    //info on arrays from: https://www.weheartswift.com/arrays/
    //array of buttons in the Simon Says pattern
    var simonPattern:[Int] = []
    //to keep track of the buttons the user presses
    var currentStep:Int = 0
    var currentRound = 1
    
    //as the screen is loading
    override func viewDidAppear(animated: Bool) {
        //seeding a random number generator (so numbers aren't the same each time) from: http://stackoverflow.com/questions/25895081/how-does-one-seed-the-random-number-generator-in-swift
        srand(UInt32(NSDate().timeIntervalSinceReferenceDate))
        inGameRoundCountLabel.text = "Round: \(currentRound)"
        startPattern()
        playSimonPattern()
    }
    
    //the game will always start with a pattern of four random colors
    func startPattern() {
        //call 'addToPattern' 4 times
        //generate 4 random numbers that get added to array
        for _ in (0 ..< 4) {
            addToPattern()
        }
        
        print("\(simonPattern)")
    }
    
    //generate a random number 0-3 and append to array
    func addToPattern() {
        let randomNumber = Int(rand()) % 4
        simonPattern.append(randomNumber)
    }
    
    //associates each button with a number 0-3
    func buttonForNumber(number:Int) -> UIButton {
        if (number == 0) {
            return yellowButton
        } else if (number == 1) {
            return blueButton
        } else if (number == 2) {
            return redButton
        } else {
            return greenButton
        }
    }
    
    func playSimonPattern() {
        //Loop through each index in simonPattern array (get button for each step) from: http://stackoverflow.com/questions/24028421/swift-for-loop-for-index-element-in-array
        for (index, number) in simonPattern.enumerate() {
            //delay for one second after each index or else everything highlights all at once
            let highlightDelay = Double(index) + 1.0
            delay(highlightDelay) {
                //highlight button
                self.highlightButton(self.buttonForNumber(number))
            }
        }
    }
    
    
    //highlight button from alpha 0.5 to alpha 1.0
    //button animation from: http://stackoverflow.com/questions/34666136/swift-how-to-make-a-button-flash-or-blink/36175309
    func highlightButton(button:UIButton) {
        //first number: transition time of animation
        //second number: how long button stays at 0.5 or highlighted
        UIView.animateWithDuration(0.1, delay: 0.0, options: [], animations: {
            button.alpha = 1.0
        }) { (success) in
            UIView.animateWithDuration(0.1, delay: 0.50, options: [], animations: {
                button.alpha = 0.5
            }, completion: nil)
        }
    }
    
    //from: http://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift
    //for delay or else all buttons light up at the same time
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    //user trying to repeat pattern
    @IBAction func buttonPressed(button:UIButton) {
        //get tag of the button that was pressed (tags were assigned to each button in the attributes inspector)
        let tag = button.tag
        //button in simonPattern (correct answer)
        let expectedTag = simonPattern[currentStep]
        let arrayCount = simonPattern.count - 1
        
        //if user entered the same button as listed in simonPattern array
        if (tag == expectedTag) {
            //they got it right!
            //when the user presses the last button in pattern
            if (currentStep == arrayCount) {
                print("You got them all right, moving to next level")
                //add one to pattern, reset user button presses, and play new pattern
                addToPattern()
                currentStep = 0
                currentRound += 1
                inGameRoundCountLabel.text = "Round: \(currentRound)"
                playSimonPattern()
            } else {
                //while user is in the middle of entering pattern
                print("Got this one right!")
                //else, increment currentStep
                currentStep += 1
            }
        } else {
            //fail
            performSegueWithIdentifier("wrongSegue", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //same as from my Mad Libs Grad Project
        //pass round data to last screen
        guard let destination = segue.destinationViewController as? FailureViewController else { return }
        destination.roundUserIsOn = currentRound
    }

}