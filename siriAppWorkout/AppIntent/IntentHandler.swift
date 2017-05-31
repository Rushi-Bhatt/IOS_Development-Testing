//
//  IntentHandler.swift
//  AppIntent
//
//  Created by Bhatt, Rushi on 5/31/17.
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

class IntentHandler: INExtension, INStartWorkoutIntentHandling {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
    func handle(startWorkout intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        print("handle")
        let activity:NSUserActivity = NSUserActivity(activityType: "Workout")
        let workout:String = intent.workoutName!.spokenPhrase!
        
        activity.userInfo = ["workoutName" : workout]
        completion(INStartWorkoutIntentResponse(code: .continueInApp, userActivity: activity))
        
    }
    
    func confirm(startWorkout intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        print("Confirm")
        completion(INStartWorkoutIntentResponse(code: .ready, userActivity: nil))
    }
    
    func resolveWorkoutName(forStartWorkout intent: INStartWorkoutIntent, with completion: @escaping (INSpeakableStringResolutionResult) -> Void) {
        if let workout = intent.workoutName {
            completion(INSpeakableStringResolutionResult.success(with: workout))
        }
        else{
            completion(INSpeakableStringResolutionResult.needsValue())
        }
        
    }
    
}

