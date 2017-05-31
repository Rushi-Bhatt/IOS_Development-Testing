//
//  IntentHandler.swift
//  AppIntent
//
//  Created by Bhatt, Rushi on 5/30/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import Intents


class IntentHandler : INExtension,
INSendPaymentIntentHandling{
    override func handler(for intent: INIntent) -> Any? {
        return self
    }
    
    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        print("handle")
        //actually send the payment here
        let activity: NSUserActivity = NSUserActivity(activityType: "Payment")
        activity.userInfo = ["name": intent.payee!.displayName, "amount": intent.currencyAmount!.amount!.stringValue]
        
        //send that data using userActivity, and receive the same in appDelegate
        completion(INSendPaymentIntentResponse(code: .inProgress, userActivity: activity))
        
        //if need be, you can set the code to .inProgess/.failure of the process will take time or the process fails
        
        
    }
    
    //before the handle method, confirm mehtod is called so here you can do all the final checking required for your application and set the code to .ready if everything is perfect
    func confirm(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        print("Confirm")
        completion(INSendPaymentIntentResponse(code: .ready, userActivity: nil))
        
    }
    
    func resolveCurrencyAmount(forSendPayment intent: INSendPaymentIntent, with completion: @escaping (INCurrencyAmountResolutionResult) -> Void) {
        guard let amount:Float = intent.currencyAmount?.amount?.floatValue else {
            completion(INCurrencyAmountResolutionResult.needsValue())
            return
        }
        
        if amount == 0 {
            completion(INCurrencyAmountResolutionResult.needsValue())
            
        }
        else{
            completion(INCurrencyAmountResolutionResult.success(with: intent.currencyAmount!))
        }
        
    }
    
    func resolvePayee(forSendPayment intent: INSendPaymentIntent, with completion: @escaping (INPersonResolutionResult) -> Void) {
        guard let payee:INPerson = intent.payee else{
            completion(INPersonResolutionResult.needsValue())
            return
        }
        
        let allowedContacts = ["James", "John", "Joseph"]
        for person in allowedContacts{
            if person == payee.displayName {
                completion(INPersonResolutionResult.success(with: payee))
            }
        }
        completion(INPersonResolutionResult.needsValue())
    }
    
    
    
    
}

