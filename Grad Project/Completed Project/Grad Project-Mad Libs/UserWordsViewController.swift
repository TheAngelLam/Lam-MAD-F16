//
//  UserWordsViewController.swift
//  Grad Project-Mad Libs
//
//  Created by Angel Lam on 11/25/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class UserWordsViewController: UIViewController, UITextFieldDelegate {

    var activeStory:NSDictionary!
    var inputNumber:Int = 0
    
    @IBOutlet weak var userWordTextField: UITextField!
    @IBOutlet weak var wordTypeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        print("\(activeStory["story"])")
        wordTypeLabel.text = wordType(inputNumber)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let userInput = userWordTextField.text?.uppercaseString
        let inputs = activeStory["inputs"] as! NSArray
        let numberOfInputs = inputs.count
        
        if (userInput!.characters.count != 0 && inputNumber < numberOfInputs-1) {
            saveUserInput(inputNumber, userInput: userInput!)
            inputNumber += 1
            userWordTextField.text = ""
            wordTypeLabel.text = wordType(inputNumber)
        } else if (inputNumber >= numberOfInputs-1) {
            saveUserInput(inputNumber, userInput: userInput!)
            performSegueWithIdentifier("segue-user-story", sender: nil)
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let destination = segue.destinationViewController as? UserStoryViewController else { return }
        //set the next screen's story
        destination.activeFinishedStory = activeStory
    }
    
    func wordType(number:Int) -> String {
        let inputs = activeStory["inputs"] as! NSArray
        let selectedInput = inputs[number] as! NSDictionary
        return selectedInput["type"] as! NSString as String
    }
    
    func saveUserInput(number:Int, userInput:String) {
        let inputs = activeStory["inputs"] as! NSArray
        let selectedInput = inputs[number] as! NSMutableDictionary
        selectedInput.setValue(userInput, forKey: "user-answer")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
