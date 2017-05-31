//
//  ViewController.swift
//  siriAppWorkout
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

    @IBOutlet weak var workoutName: UILabel!
    
    func showWorkout(){
        if let workout = userActivity?.userInfo?["workoutName"] as? String{
            workoutName.text = "You started \(workout)"
            
        }
        else{
            workoutName.text = "No user info"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

