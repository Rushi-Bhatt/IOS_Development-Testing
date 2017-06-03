//
//  ViewController.swift
//  notificationApp
//
//  Created by Bhatt, Rushi on 6/2/17.
//  Copyright © 2017 rushi. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {
    var isAccessGrantedForNotification = false
    var pizzaCount = 0
    var pizzaSteps = ["Make Pizza","Roll a Dough","Add Souce","Add Cheese","Add Ingredients", "Bake", "Done"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (granted, error) in
            self.isAccessGrantedForNotification = granted
            if !granted {
                //show alert to user saying that notifications are required part
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func makeContent() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "Make Pizza"
        content.body = "Time to Make a Pizza!!"
        content.userInfo = ["step":0]
        content.categoryIdentifier = "make.steps.category"
        //for adding image as an attachment
        content.attachments = pizzaStepImage(step: 0)

        return content
    }
    
    func addNotifications(trigger: UNNotificationTrigger? , content: UNMutableNotificationContent, identifier: String){
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print("Error occured : \(error!.localizedDescription)")
            }
        }
    }
    //everytime this function is called, the content of the notification is changed to the next step
    //we are doing this by passing the request object (because pending notifications return requestList object) to the function and using that request to generate the new content for that request and then trigger the same request with the new content
    func updatePizzaStep(request: UNNotificationRequest){
        if request.identifier.hasPrefix("message.make"){
            var step = request.content.userInfo["step"]as! Int
            step = (step + 1) % pizzaSteps.count
            let updatedContent = makeContent()
            updatedContent.body = pizzaSteps[step]
            updatedContent.userInfo = ["step": step]
            updatedContent.subtitle = request.content.subtitle
            updatedContent.attachments = pizzaStepImage(step: step)
            addNotifications(trigger: request.trigger, content: updatedContent, identifier: request.identifier)
        }
    }
    
    //MARK: - Delegates - InApp notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound])
    }
    
    //MARK: - Delegates - Perform action
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let action = response.actionIdentifier
        let request = response.notification.request
        if action == "next.step.action" {
            updatePizzaStep(request: request)
        }
        if action == "stop.action"{
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [request.identifier])
        }
        if action == "snooze.action"{
            print("Snoozed")
            //here we need to change the trigger to timeinterval rather than calendar
            let newTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
            let newRequest = UNNotificationRequest(identifier: request.identifier, content: request.content, trigger: newTrigger)
            UNUserNotificationCenter.current().add(newRequest, withCompletionHandler: { (error) in
                if error != nil {
                    print("Error: \(error!.localizedDescription)")
                }
            })
        }
        if action == "text.input.action"{
            let textResponse  = response as! UNTextInputNotificationResponse
            let newContent = request.content.mutableCopy() as! UNMutableNotificationContent
            newContent.subtitle = textResponse.userText
            addNotifications(trigger: request.trigger, content: newContent, identifier: request.identifier)
        }
        completionHandler()
    }
    
    //For adding video/ audio to the notificaitons
    func notificationAttachment(for identifier:String, resource: String, type:String) -> [UNNotificationAttachment]{
    
        let extendedIdentifier = identifier+"."+type
        guard let path = Bundle.main.path(forResource: resource, ofType: type)
            else{
                print("The file \(resource).\(type) not found")
                return []
        }
        let videoURL = URL(fileURLWithPath: path)
        do{
            let attachment = try UNNotificationAttachment(identifier: extendedIdentifier, url: videoURL, options: nil)
            return [attachment]
        }
        catch{
            print("The attachment was not loaded")
            return []
        }
    }
    
    //for adding images 
    func pizzaStepImage(step:Int)-> [UNNotificationAttachment]{
    
        let stepString = String(format: "%i", step)
        let identifier  = "pizza.step."+stepString
        let resource = "makePizza"+stepString
        let type = "png"
        return notificationAttachment(for: identifier, resource: resource, type: type)
    }

    @IBAction func schedulePizza(_ sender: UIButton) {
        if(isAccessGrantedForNotification){
            let content = UNMutableNotificationContent()
            content.title = "Schedule Pizza"
            content.body = "Time to Schedule a Pizza!!"
            //for now lets set the trigger to  15seconds
            let unitFlags:Set<Calendar.Component>  = [.minute,.hour,.second]
            var date = Calendar.current.dateComponents(unitFlags, from: Date())
            date.second = date.second! + 15
            content.categoryIdentifier = "snooze.category"
            let attachment = notificationAttachment(for: "pizza.video", resource: "video", type: "mp4")
            //let attachment = notificationAttachment(for: "pizza.music", resource: "audio", type: "mp3")
            content.attachments = attachment
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
            addNotifications(trigger: trigger, content: content, identifier: "message.schedule")
        
        
        }
    }
    @IBAction func makePizza(_ sender: UIButton) {
        if(isAccessGrantedForNotification){
            pizzaCount += 1
            let content  = makeContent()
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
            content.subtitle = "Pizza number: \(pizzaCount)"
            //for in app notification
            UNUserNotificationCenter.current().delegate=self
            addNotifications(trigger: trigger, content: content, identifier: "message.make.\(pizzaCount)")
     
        }
    }
   
    @IBAction func nextStepPizza(_ sender: UIButton) {
        if(isAccessGrantedForNotification){
            UNUserNotificationCenter.current().getPendingNotificationRequests(completionHandler: { (requestList) in
                if let request = requestList.first {
                    if request.identifier.hasPrefix("message.make"){
                        self.updatePizzaStep(request: request)
                    }
                    else{
                        let content = request.content.mutableCopy() as! UNMutableNotificationContent
                        self.addNotifications(trigger: request.trigger, content: content, identifier: request.identifier)
                    }
                }
            })
        }
    }
    
    //Consider that this method returns request objects, not notifications objects
    @IBAction func viewPendingNotifications(_ sender: UIButton) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requestList) in
            print("\(Date()) -- > \(requestList.count) notifications are pending")
            for request in requestList{
                print("\(request.identifier) --> \(request.content.body)")
            }
        }
    }
    //Consider that this method returns notifications objects, not requests objects
    @IBAction func viewDeliveredNotifications(_ sender: UIButton) {
        UNUserNotificationCenter.current().getDeliveredNotifications { (notificationList) in
            print("\(Date()) -- > \(notificationList.count) notifications are Delivered")
            for notification in notificationList{
                print("\(notification.request.identifier) --> \(notification.request.content.body)")
            }

        }
    }
    @IBAction func removeNotifications(_ sender: UIButton) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
            if let request = requests.first
            {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [request.identifier])
                print("Notification  removed")
            }
        }
    }

}

