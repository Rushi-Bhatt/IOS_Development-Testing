//
//  ViewController.swift
//  siriAppPayments
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

    @IBOutlet weak var notifyLabel: UILabel!
    func showNotification(){
        let payee = userActivity!.userInfo?["name"] as! String
        let amount = userActivity!.userInfo?["amount"] as! String
        notifyLabel.text = "You sent $\(amount) to \(payee)."
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

