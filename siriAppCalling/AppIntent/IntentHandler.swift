//
//  IntentHandler.swift
//  AppIntent
//
//  Created by Bhatt, Rushi on 5/30/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import Intents


class IntentHandler: INExtension,INStartAudioCallIntentHandling {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
    func handle(startAudioCall intent: INStartAudioCallIntent, completion: @escaping (INStartAudioCallIntentResponse) -> Void) {
        print("Handle")
        let activity: NSUserActivity = NSUserActivity(activityType: "Call")
        activity.userInfo = ["person": intent.contacts![0].displayName]
        completion(INStartAudioCallIntentResponse(code: .continueInApp, userActivity: activity))
        return
    }
    
    func confirm(startAudioCall intent: INStartAudioCallIntent, completion: @escaping (INStartAudioCallIntentResponse) -> Void) {
        print("confirm")
        completion(INStartAudioCallIntentResponse(code: .ready, userActivity: nil))
    }
    
    func resolveContacts(forStartAudioCall intent: INStartAudioCallIntent, with completion: @escaping ([INPersonResolutionResult]) -> Void) {
        //here we need to create the handlers for person and send that data in intent
        let contacts:[String] = ["James","John","Joseph"]
        for contact in contacts{
            if(intent.contacts?[0].spokenPhrase?.uppercased() == contact.uppercased()){
                print("Found One")
                let personHandle: INPersonHandle = INPersonHandle(value: "984-202-9667", type: .phoneNumber)
                let person:INPerson = INPerson(personHandle: personHandle, nameComponents: nil, displayName: contact, image: nil, contactIdentifier: nil, customIdentifier: nil)
                completion([INPersonResolutionResult.success(with: person)])
            }
        }
        completion([INPersonResolutionResult.needsValue()])
    }
}

