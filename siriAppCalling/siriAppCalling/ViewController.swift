//
//  ViewController.swift
//  siriAppCalling
//
//  Created by Bhatt, Rushi on 5/30/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var personContact: UILabel!
    func showContact(){
        if let person = userActivity?.userInfo!["person"] as? String{
            personContact.text = "You are calling \(person)"
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

