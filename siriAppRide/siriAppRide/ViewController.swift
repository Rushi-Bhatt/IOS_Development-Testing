//
//  ViewController.swift
//  siriAppRide
//
//  Created by Bhatt, Rushi on 5/31/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var driverInfo: UILabel!
    
    func showDriverDetails(){
        let driver:String = userActivity?.userInfo!["driver"] as! String
        let number:String = userActivity?.userInfo!["number"] as! String
        driverInfo.text = "Your Driver \(driver) with contact number \(number) is arriving soon"
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

