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
    var urlString = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.downloadJsonWithURL()
    }
   
    var nameData:[String] = []
    var dobData:[String] = []
    var imgData:[String] = []
    
    //Downloading JSON from URL
    func downloadJsonWithURL(){
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: { (data, response, error)  -> Void in
            if let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments ) as? NSDictionary {
                print(jsonObject!.value(forKey: "actors")!)
                if let actorArray = jsonObject!.value(forKey: "actors") as? NSArray{
                    for actor in actorArray {
                        if let actorDict = actor as? NSDictionary {
                            if let name = actorDict.value(forKey: "name"){
                                self.nameData.append(name as! String)
                            }
                            if let dob = actorDict.value(forKey: "dob"){
                                self.dobData.append(dob as! String)
                            }
                            if let img = actorDict.value(forKey: "image"){
                                self.imgData.append(img as! String)
                            }
                            
                            OperationQueue.main.addOperation({
                                self.myTableView.reloadData()
                            })
                            
                        }
                    }
                }
            }
        }).resume()
    }
    
    //table view data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameData.count
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeCell
        cell.nameLabel.text = nameData[indexPath.row]
        cell.dobLabel.text  = dobData[indexPath.row]
        let imgURL = NSURL(string: imgData[indexPath.row])
        if imgURL != nil{
        let data = NSData(contentsOf: (imgURL as URL?)!)
        cell.imageView?.image = UIImage(data: data! as Data)
            
        }
        return cell
        
    }
    
    //delegate methods to handle the table view row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item: \(nameData[indexPath.row])")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //HTTP request
    @IBAction func registerForStormpath(_ sender: Any) {
        var request = URLRequest(url: URL(string: "https://stormpathnotes.herokuapp.com/register")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonObj = [
            "email" : "rushibhatt5470@gmail.com",
            "password" : "Bhatt@5453",
            "givenName" : "Rushi",
            "surname" : "Bhatt"
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: jsonObj, options: [])
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data{
                print(String(data: data , encoding: .utf8)!)
            }
        }
        task.resume()
    }


}

