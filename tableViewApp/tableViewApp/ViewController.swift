//
//  ViewController.swift
//  tableViewApp
//
//  Created by Bhatt, Rushi on 5/31/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let data:[String] = ["Item1","Item2","Item3","Item4","Item5","Item6"] //for non section data
    let sData:[[String]] = [["Item1","Item2","Item3","Item4","Item5","Item6"],
                            ["ItemA","ItemB","ItemC"],
                            ["Item I","Item II","Item III"]] //for section data
    let titles:[String] = ["Number","Alphabets","Romans"]
    let subData:[[String]] = [["sub1","sub2","sub3","sub4","sub5","sub6"],
                              ["subA","subB","subC"],
                              ["sub I","sub II","sub III"]] //for subtitles data
    
    let imageData:[[String]] = [["1","2","3","4","5","6"],
                                ["a","b","c"],
                                ["romani","romanii","romaniii"]] //for image data


    
    
    //table view data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      return data.count //for non section data
        return sData[section].count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//      let cell = UITableViewCell()
//      for better performance , use the following method
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//      cell.textLabel?.text = data[indexPath.row]   //for non section data
        cell.textLabel?.text = sData[indexPath.section][indexPath.row]
        cell.detailTextLabel?.text = subData[indexPath.section][indexPath.row]
        cell.imageView?.image = UIImage(named: imageData[indexPath.section][indexPath.row])
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

