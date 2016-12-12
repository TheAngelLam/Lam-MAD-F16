//
//  FailureViewController.swift
//  Simon Says
//
//  Created by Angel Lam on 12/8/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class FailureViewController: UIViewController {
    
    @IBOutlet weak var roundsCorrectLabel: UILabel!
    
    var roundUserIsOn:Int!
    
    override func viewDidAppear(animated: Bool) {
        roundsCorrectLabel.text = "You got \(roundUserIsOn - 1) rounds correct!"
    }
    
    @IBAction func playAgainButton(sender: AnyObject) {
        //from my Mad Libs Grad Project app
        navigationController?.popToRootViewControllerAnimated(true)
    }
}