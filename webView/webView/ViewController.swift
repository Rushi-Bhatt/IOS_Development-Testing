//
//  ViewController.swift
//  webView
//
//  Created by Bhatt, Rushi on 5/26/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,UITextFieldDelegate {

    var webView:WKWebView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
//        webView = WKWebView(frame: CGRect(x: 0, y: 30, width: 500, height: 500))
        
        
//loading HTML String
//        webView.loadHTMLString("<h1>Welcome to web view </h1><p>This is the first lesson of the chapter</p>", baseURL: nil)
        
        
//Loading HTML File
//        let url:URL = Bundle.main.url(forResource: "page", withExtension: "html")!
//        let urlRequest:URLRequest = URLRequest(url: url)
//        webView.load(urlRequest)
        
//loading data from URL
//        let url1:URL = URL(string: "https://www.google.com")!
//        let urlRequest1:URLRequest = URLRequest(url: url1)
//        webView.load(urlRequest1)
        
//to add the constraints, we need to remove the frame
        
        webView = WKWebView()
        view.addSubview(webView)
        
        
//adding constraints manually
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        let width = NSLayoutConstraint(item: webView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        
        let height = NSLayoutConstraint(item: webView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: -60)
        
        let top = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 60)
        
        view.addConstraints([width,height,top])
        
    }
    

    @IBAction func goBack(_ sender: UIButton) {
            webView.goBack()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                let url:URL = URL(string: textField.text!)!
                let urlRequest:URLRequest = URLRequest(url: url)
                webView.load(urlRequest)
        //to enable the keyboard, press Command+K if it doesnt show up automatically then
                textField.resignFirstResponder() //To hide the keyboard on click of go
                return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

