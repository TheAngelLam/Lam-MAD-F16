//
//  ViewController.swift
//  Grad Project-Mad Libs
//
//  Created by Angel Lam on 11/25/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class StorySelectionViewController: UIViewController {
    
    // Dictionary from iOS book
    //was not working (problem indexing) so created a plist to use as a dictionary: https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/PropertyLists/AboutPropertyLists/AboutPropertyLists.html
    //creating a plist: https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/PropertyLists/QuickStartPlist/QuickStartPlist.html
//    var magicFunStory:[String:Any] = [
//        "story" : "Wizards and witches from all over travel to REPLACE_1 to attend The REPLACE_2 School of Magic. In addition to learning magic in order to become full fledge magic wielders, students are also expected to REPLACE_3 for hours on end. After 5 REPLACE_4 years and passing the REPLACE_5 exam, student can graduate and can start REPLACE_6 for world peace.",
//        "inputs": [
//            ["type" : "Proper Noun (Place)", "replacement_text": "REPLACE_1", "user-answer" : nil],
//            ["type" : "Noun", "replacement_text": "REPLACE_2", "user-answer" : nil],
//            ["type" : "Activity", "replacement_text": "REPLACE_3", "user-answer" : nil],
//            ["type" : "Number", "replacement_text": "REPLACE_4", "user-answer" : nil],
//            ["type" : "Noun", "replacement_text": "REPLACE_5", "user-answer" : nil],
//            ["type" : "Verb ending in -ing", "replacement_text": "REPLACE_6", "user-answer" : nil]
//        ]
//    ]
//
    
    //Navigation Controller research from: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson8.html
    //Navigation Controller: "...manages transitions backward and forward through a series of view controllers."
    
    //access dictionary
    var selectedStory:NSDictionary? = nil
    //access array inputs
    var stories:NSArray! = nil
    
    @IBAction func magicFunStorySelected(sender: UIButton) {
        //set selected story
        selectedStory = stories[0] as? NSDictionary
        //fire off the segue to User Words View Controller
        performSegueWithIdentifier("segue-user-words", sender: nil)
    }
    
    @IBAction func dayInLifeOfAnimalStorySelected(sender: UIButton) {
        selectedStory = stories[1] as? NSDictionary
        performSegueWithIdentifier("segue-user-words", sender: nil)
    }
    
    @IBAction func wonderfulWorldOfImaginationStorySelected(sender: UIButton) {
        selectedStory = stories[2] as? NSDictionary
        performSegueWithIdentifier("segue-user-words", sender: nil)
    }
    
    @IBAction func funFilledFantasyStorySelected(sender: UIButton) {
        selectedStory = stories[3] as? NSDictionary
        performSegueWithIdentifier("segue-user-words", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //access the plist...from: http://stackoverflow.com/questions/24045570/swift-read-plist
        let path = NSBundle.mainBundle().pathForResource("stories", ofType: "plist")!
        stories = NSMutableArray(contentsOfFile: path)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // "guard" statement from Lynda Programming for Non-Programmers: iOS 9 and Swift tutorial
        // Explaination of a guard statement from: http://ericcerney.com/swift-guard-statement/
        //we only care about the segue if we are going to a UserWordsViewController
        guard let destination = segue.destinationViewController as? UserWordsViewController else { return }
        
        //preconditionFailure from: http://stackoverflow.com/questions/29673027/difference-between-precondition-and-assert-in-swift
        //make sure selected story has been set so app doesn't crash
        guard let selectedStory = selectedStory else { preconditionFailure() }
        
        //set the next screen's story
        destination.activeStory = selectedStory
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

