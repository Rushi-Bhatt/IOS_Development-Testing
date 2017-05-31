//
//  IntentHandler.swift
//  AppIntent
//
//  Created by Bhatt, Rushi on 5/30/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension, INSearchForPhotosIntentHandling {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
    func handle(searchForPhotos intent: INSearchForPhotosIntent, completion: @escaping (INSearchForPhotosIntentResponse) -> Void) {
        //phrase:search for photos tagged cats in siriAppPhotos
        let activity:NSUserActivity = NSUserActivity(activityType: "Photos")
        activity.userInfo = ["album":intent.albumName!]
        completion(INSearchForPhotosIntentResponse(code: .continueInApp , userActivity: activity))
        return
    }
    
    func resolveAlbumName(forSearchForPhotos intent: INSearchForPhotosIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let album = intent.albumName {
            completion(INStringResolutionResult.success(with: album))
            return
        }
        
        completion(INStringResolutionResult.needsValue())
       
    }
}

