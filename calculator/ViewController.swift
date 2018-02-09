//
//  ViewController.swift
//  calculator
//
//  Created by Jack Perry on 9/2/18.
//  Copyright © 2018 Jack Perry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: Any)
    {
        if performingMath == true
        {
        label.text = String((sender as AnyObject).tag-1)
        numberOnScreen = Double(label.text!)!
        performingMath = true;
        }
        else{
        label.text = label.text! + String((sender as AnyObject).tag-1)
        numberOnScreen = Double(label.text!)!
    }
    }
    
    
    @IBAction func buttons(_ sender: Any)
    {
        if label.text != "" && (sender as AnyObject).tag != 16
        
        {
            self.previousNumber = Double(self.label.text!)!
            if (sender as AnyObject).tag == 12 //div
            {
                self.label.text = "/"
            }
            else if (sender as AnyObject).tag == 13 //mult
            {
                self.label.text = "x"
            }
            else if (sender as AnyObject).tag == 14 //minus
            {
                self.label.text = "-"
            }
            else if (sender as AnyObject).tag == 15 //plus
            {
                self.label.text = "-"
            }
            
            operation = (sender as AnyObject).tag
            self.performingMath = true;
       }
     else if (sender as AnyObject).tag == 16
        {
            if operation == 12
            {
                 label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                 label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                 label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if (sender as AnyObject).tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
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

