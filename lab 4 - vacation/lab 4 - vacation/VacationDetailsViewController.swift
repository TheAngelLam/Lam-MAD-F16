//
//  ViewController.swift
//  lab 4 - vacation
//
//  Created by Angel Lam on 10/2/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class VacationDetailsViewController: UIViewController {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var worldLabel: UILabel!
    
    var vacationIdea = VacationIdeas()
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue) {
        stateLabel.text = vacationIdea.stateVaca
        countryLabel.text = vacationIdea.countryVaca
        worldLabel.text = vacationIdea.worldVaca
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

