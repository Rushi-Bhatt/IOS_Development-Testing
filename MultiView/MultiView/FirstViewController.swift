//
//  FirstViewController.swift
//  MultiView
//
//  Created by Bhatt, Rushi on 5/31/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newView = segue.destination as! SecondViewController
        if segue.identifier == "btn2" {
            newView.text2 = "Button 2 clicked"
        }
        else if segue.identifier == "btn1" {
            newView.text2 = "Button 1 clicked"
        }
        
    }

}

