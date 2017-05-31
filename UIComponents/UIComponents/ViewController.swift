//
//  ViewController.swift
//  UIComponents
//
//  Created by Bhatt, Rushi on 5/26/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Picker View
    @IBOutlet weak var selection: UILabel!
    let items : [[String]] = [
        ["A1","A2","A3"],
        ["B1","B2","B3","B4"],
        ["C1","C2"]
    ]
    //had it been the single dimention array for just one picker view
    //    let items : [String] = ["A1","A2","A3"]

    //data source methods - picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items[component].count     //return items.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return items.count                //return 1 //number of columns
    }
    
    //delegation methods - picker view
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[component][row]     //return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection.text = items[component][row]  //selection.text = items[row]
    }

/////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Creating labels and buttons using code
        
//        let label:UILabel = UILabel(frame: CGRect(x: 10, y: 500, width: 150, height: 40))
//        label.text = "Manual Label"
//        view.addSubview(label)
//        
//        let btn:UIButton = UIButton(frame: CGRect(x: 10, y: 550, width: 150, height: 40))
//        btn.setTitle("codedButton", for: .normal)
//        btn.backgroundColor = UIColor.gray //have to specify as the default bg is white so
//        btn.addTarget(self, action: #selector(didClick), for: UIControlEvents.touchUpInside)
//        view.addSubview(btn)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didClick(btn:UIButton){
        btn.setTitle("Clicked", for: .normal)
    }
    
/////////////////////////////////////////////////////////////////////////////////////////////////

    //Alert and Actionsheets
    @IBAction func showAlert(_ sender: UIButton){
        let alert:UIAlertController = UIAlertController(title: "Title", message: "AlertMessage", preferredStyle: .alert)
        let action1:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
            print("Cancelled!!")
        }
        alert.addAction(action1)
        
        let action2:UIAlertAction = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
            print("Okay!!")
        }
        alert.addAction(action2)
        self.present(alert, animated: true) {
            print("Alert popped up")
        }
    }
    @IBAction func showActionSheet(_ sender: UIButton) {
        let alert2:UIAlertController = UIAlertController(title: "Title", message: "ActionSheetMessage", preferredStyle: .actionSheet)
        let action2:UIAlertAction = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            print("Deleted")
        }
        alert2.addAction(action2)
        self.present(alert2, animated: true) { 
            print("Action Sheet popped up")
        }
    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////
 
    //Slider and progress bars
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func sliderDidChange(_ sender: UISlider) {
        progressBar.progress = sender.value/sender.maximumValue //to map the slider and the progess bar
    }
  
////////////////////////////////////////////////////////////////////////////////////////////////
    
    //switch and activity indicator view
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if(sender.isOn && !activityIndicator.isAnimating  ){
            activityIndicator.startAnimating()
        }
        if(!sender.isOn && activityIndicator.isAnimating){
            activityIndicator.stopAnimating()
        }
    }

////////////////////////////////////////////////////////////////////////////////////////////////
    
    //segmented control
    @IBOutlet weak var segmentValue: UILabel!
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        segmentValue.text = sender.titleForSegment(at: sender.selectedSegmentIndex)
    }

////////////////////////////////////////////////////////////////////////////////////////////////
    

}

