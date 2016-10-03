//
//  Scene2ViewController.swift
//  lab 4 - vacation
//
//  Created by Angel Lam on 10/2/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userState: UITextField!
    @IBOutlet weak var userCountry: UITextField!
    @IBOutlet weak var userWorld: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneAddVacation" {
            let scene1ViewController = segue.destinationViewController as! ViewController
            if userState.text?.isEmpty == false {
                scene1ViewController.user.stateVaca = userState.text
            }
            if userCountry.text?.isEmpty == false {
                scene1ViewController.user.countryVaca = userCountry.text
            }
            if userWorld.text?.isEmpty == false {
                scene1ViewController.user.worldVaca = userWorld.text
            }
        }
    }
    
    //close keyboard when press done
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //close the keyboard when the user taps the background
    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        userState.resignFirstResponder()
        userCountry.resignFirstResponder()
        userWorld.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        userState.delegate = self
        userCountry.delegate = self
        userWorld.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
