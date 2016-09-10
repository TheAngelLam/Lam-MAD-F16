//
//  ViewController.swift
//  lab 1
//
//  Created by Angel Lam on 9/7/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Images
    @IBOutlet weak var coverImage: UIImageView!
    
    //Text
    @IBOutlet weak var displayText: UILabel!
    
    @IBAction func buttonPressed(sender: UIButton) {
        let title = sender.titleForState(.Normal)!
        let text = "You are viewing the \"\(title)\" picture."
        displayText.text = text;
        
        if sender.currentTitle == "Puppies Kissing" {
            coverImage.image = UIImage(named: "puppies-1.png")
        } else if sender.currentTitle == "Husky" {
            coverImage.image = UIImage(named: "husky.png")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

