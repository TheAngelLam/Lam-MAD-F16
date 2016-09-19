//
//  ViewController.swift
//  lab 2 - hamsters
//
//  Created by Angel Lam on 9/18/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hamstersImage: UIImageView!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var blueFontSwitch: UISwitch!
    
    func updateText() {
        if imageControl.selectedSegmentIndex == 0 {
            if (capitalSwitch.on) {
                displayText.text = "This is a short haired hamster.".uppercaseString
            } else {
                displayText.text = "This is a short haired hamster."
            }
        } else if imageControl.selectedSegmentIndex == 1 {
            if (capitalSwitch.on) {
                displayText.text = "This is a long haired hamster.".uppercaseString
            } else {
                displayText.text = "This is a long haired hamster."
            }
        }
    }
    
    func updateImage(){
        if imageControl.selectedSegmentIndex == 0 {
            hamstersImage.image = UIImage(named: "hamster-short haired")
        } else if imageControl.selectedSegmentIndex == 1 {
            hamstersImage.image = UIImage(named: "hamster-long haired")
        }
    }

    @IBAction func changeFontToCaps(sender: UISwitch) {
        updateText()
    }
    
    @IBAction func changeFontToBlue(sender: UISwitch) {
        if sender.on {
            displayText.textColor = UIColor.blueColor()
        } else {
            displayText.textColor = UIColor.blackColor()
        }
    }
    
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize:CGFloat = CGFloat(sender.value)
        displayText.font = UIFont.systemFontOfSize(fontSize)
    }
    
    @IBAction func imageControlPressed(sender: UISegmentedControl) {
        updateImage()
        updateText()
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

