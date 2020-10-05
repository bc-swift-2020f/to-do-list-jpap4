//
//  LocalNotificationManager.swift
//  ToDo List
//
//  Created by John Pappas on 10/5/20.
//  Copyright © 2020 John Pappas. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

struct LocalNotificationManager {
    
    static func authorizeLocalNotifications(viewController: UIViewController) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard error == nil else{
                print("Erorr \(error!.localizedDescription)")
                return
            }
            if granted {
                print("Notification Auth. Granted")
            } else {
                print("User Has Denied Notifications")
                DispatchQueue.main.async {
                    viewController.oneButtonAlert(title: "User Has Not Allowed Notifications", message: "To receive alerts for reminders, open the Settings app, select To Do List > Notifications > Allow Notifications")
                }
            }
        }
    }
    
    static func isAuthorized(completed: @escaping (Bool)->() ) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard error == nil else{
                print("Erorr \(error!.localizedDescription)")
                completed(false)
                return
            }
            if granted {
                print("Auth. Granted")
                completed(true)
            } else {
                print("Denied Notification")
                completed(false)
            }
        }
    }
    
    static func setCalendarNotification(title: String, subtitle: String, body: String, badgeNumber: NSNumber?, sound: UNNotificationSound?, date: Date) -> String {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.sound = sound
        content.badge = badgeNumber
        
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        dateComponents.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let notificationID = UUID().uuidString
        let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("ERROR \(error.localizedDescription)")
            } else {
                print("Notification schdueled \(notificationID), title: \(content.title)")
            }
        }
        return notificationID
    }
}
