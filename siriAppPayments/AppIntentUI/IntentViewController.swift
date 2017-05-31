//
//  IntentViewController.swift
//  AppIntentUI
//
//  Created by Bhatt, Rushi on 5/30/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var imagePayee: UIImageView!
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        print("Reached here")
        if let intent  = interaction.intent as? INSendPaymentIntent {
            switch(intent.payee!.displayName){
            case "James":
                print("James")
                imagePayee.image = UIImage(named: "img1")
                break
            case "John":
                print("John")
                imagePayee.image = UIImage(named: "img2")
                break
            case "Joseph":
                print("Joseph")
                imagePayee.image = UIImage(named: "img3")
                break
            default:
                break
            }
        }
        
        if let completion = completion {
            completion(self.desiredSize)
        }
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
