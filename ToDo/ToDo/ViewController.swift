//
//  ViewController.swift
//  ToDo
//
//  Created by Bhatt, Rushi on 5/26/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var txtOutput: UITextView!
    var taskString:String = ""
    var taskList:[String] = []
    
    //Date picker 
    
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerDidChange(picker) //since we dont have any sender object, we can choose any object to send as an argument
        
    }

    @IBAction func addTask(_ sender: UIButton) {
        let input:String? = txtInput.text?.trim()
        guard let newTask = input, !(input?.isEmpty)! else{
                return
        }
        print(newTask)
        taskList.append(newTask)
        txtInput.text = ""
        taskString = ""
        for task in taskList{
            
            taskString = taskString.appending(task)
            taskString = taskString.appending("\n")
            
        }
        txtOutput.text = taskString
        
    }
    @IBAction func pickerDidChange(_ sender: UIDatePicker) {
        //change the label to the corresponding day of the date
        let date:Date = picker.date
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let day:String = formatter.string(from: date)
        dayLabel.text = day
  
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


