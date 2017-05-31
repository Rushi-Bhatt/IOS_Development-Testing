//
//  ViewController.swift
//  siriAppPhotos
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

    @IBOutlet weak var albumName: UILabel!
    func showAlbumName(){
        if let album = userActivity?.userInfo?["album"] as? String {
            albumName.text = "The album name is \(album)."
        }
        else{
            albumName.text = "the user info is \(userActivity!.userInfo!)."
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

