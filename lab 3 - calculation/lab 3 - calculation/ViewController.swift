//
//  ViewController.swift
//  lab 3 - calculation
//
//  Created by Angel Lam on 9/24/16.
//  Copyright © 2016 Angel Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var subtotalField: UITextField!
    @IBOutlet weak var shippingCosts: UITextField!
    @IBOutlet weak var taxPercentage: UITextField!
    @IBOutlet weak var totalCosts: UILabel!
    
    
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        updateTotal()
    }
    
    func updateTotal() {
        guard let subtotal:Float = Float(subtotalField.text ?? "") else { return } //from Programming for Non-programmers Lynda.com tutorial
        guard let shipping:Float = Float(shippingCosts.text ?? "") else { return }
        guard var tax:Float = Float(taxPercentage.text ?? "") else { return }
        tax /= 100
        
        let total = (subtotal + shipping) * (1 + tax)
        
        //currency formatter
        let formatAsCurrency = NSNumberFormatter()
        formatAsCurrency.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        totalCosts.text = formatAsCurrency.stringFromNumber(total)
    }
    
    func checkForAllInputs() {
        if subtotalField.text == nil || subtotalField.text?.characters.count == 0 {  //no text; from Swift 2 book
            let msg = "You didn't enter a subtotal!"
            let controller2 = UIAlertController(title: "Something is wrong!", message: msg, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2, animated: true, completion: nil)
        }
        if shippingCosts.text == nil || shippingCosts.text?.characters.count == 0 {  //no text
            let msg = "You didn't enter the shipping costs!"
            let controller2 = UIAlertController(title: "Something is wrong!", message: msg, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2, animated: true, completion: nil)
        }
        if taxPercentage.text == nil || taxPercentage.text?.characters.count == 0 {  //no text
            let msg = "You didn't enter the tax!"
            let controller2 = UIAlertController(title: "Something is wrong!", message: msg, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2, animated: true, completion: nil)
        }
    }
    
    @IBAction func onButtonPressed(sender: AnyObject) {
        checkForAllInputs()
        updateTotal()
    }
    
    //Dismiss keyboard when touch the background view
    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        subtotalField.resignFirstResponder()
        shippingCosts.resignFirstResponder()
        taxPercentage.resignFirstResponder()
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

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("Text field should return")
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {  //to view what the app is doing
        print("Text field did end editing")
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("Text field did begin editing")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("Text field should change characters \(string)")
        return true
    }
}

