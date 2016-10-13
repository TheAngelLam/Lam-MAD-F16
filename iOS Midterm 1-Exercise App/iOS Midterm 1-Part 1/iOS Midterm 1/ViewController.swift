//
//  ViewController.swift
//  iOS Midterm 1
//
//  Created by Angel Lam on 10/13/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var workoutTimeTextField: UITextField!
    @IBOutlet weak var milesRanLabel: UILabel!
    @IBOutlet weak var caloriesBurnedLabel: UILabel!
   
    func updateMilesRan() {
        let time = Float(workoutTimeTextField.text!) //workout time
        let milesRan = Float(time!/10)
        
        milesRanLabel.text =  String(milesRan)
    }
    
    func updateCaloriesBurned() {
        let time = Float(workoutTimeTextField.text!) //workout time
        let caloriesBurned = Float((time!/60)*600)
        
        caloriesBurnedLabel.text = String(caloriesBurned)
    }
    
    @IBAction func calculateButton(sender: UIButton) {
        updateMilesRan()
        updateCaloriesBurned()
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

