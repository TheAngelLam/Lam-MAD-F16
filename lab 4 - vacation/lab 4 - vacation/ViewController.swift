//
//  ViewController.swift
//  lab 4 - vacation
//
//  Created by Angel Lam on 10/2/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var worldLabel: UILabel!
    
    var user = VacationIdeas()
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue) {
        stateLabel.text = user.stateVaca
        countryLabel.text = user.countryVaca
        worldLabel.text = user.worldVaca
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

