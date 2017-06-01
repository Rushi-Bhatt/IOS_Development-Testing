//
//  ViewController.swift
//  customCell
//
//  Created by Bhatt, Rushi on 5/31/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let sData:[[String]] = [["Item1","Item2","Item3","Item4","Item5","Item6"],
                            ["ItemA","ItemB","ItemC"],
                            ["Item I","Item II","Item III"]] //for section data
    let titles:[String] = ["Number","Alphabets","Romans"]
    
    
    //table view data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sData[section].count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeCell
        cell.label.text = sData[indexPath.section][indexPath.row]
        return cell
        
    }
    
    //delegate methods to handle the table view row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item: \(sData[indexPath.section][indexPath.row])")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

