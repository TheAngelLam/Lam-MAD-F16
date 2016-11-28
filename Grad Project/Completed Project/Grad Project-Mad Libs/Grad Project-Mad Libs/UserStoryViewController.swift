//
//  UserStoryViewController.swift
//  Grad Project-Mad Libs
//
//  Created by Angel Lam on 11/26/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class UserStoryViewController: UIViewController {
    
    @IBOutlet weak var titleOfStoryLabel: UILabel!
    @IBOutlet weak var finishedStoryLabel: UILabel!
    
    //access dictionary
    var activeFinishedStory:NSDictionary!
    
    @IBAction func playAgainButton(sender: UIButton) {
        //going back to root view controller from: http://stackoverflow.com/questions/5281895/popping-to-root-view-in-navigation-controller
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //as the screen is loading
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        finishedStoryLabel.text = activeFinishedStory["story"] as! String
        
        //replace Strings from: http://stackoverflow.com/questions/24200888/any-way-to-replace-characters-on-swift-string
        var story = activeFinishedStory["story"] as! String
        let inputs = activeFinishedStory["inputs"] as! NSArray
        
        for input in inputs {
            let replaceThisString = input["replacement_text"] as! String
            let userAnswer = input["user-answer"] as! String
            
            story = story.stringByReplacingOccurrencesOfString(replaceThisString, withString: userAnswer)
        }
        
        //set story title text
        titleOfStoryLabel.text = activeFinishedStory["title"] as? String
        //set story label text
        finishedStoryLabel.text = story
        
    }
    
}