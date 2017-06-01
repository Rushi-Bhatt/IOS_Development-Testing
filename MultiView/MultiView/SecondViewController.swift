//
//  SecondViewController.swift
//  MultiView
//
//  Created by Bhatt, Rushi on 5/31/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label2: UILabel!
    var text2:String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label2.text = text2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

