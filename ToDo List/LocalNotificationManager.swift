//
//  LocalNotificationManager.swift
//  ToDo List
//
//  Created by John Pappas on 10/5/20.
//  Copyright © 2020 John Pappas. All rights reserved.
//

import Foundation
import UserNotifications

struct LocalNotificationManager {
    
    static func authorizeLocalNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard error == nil else{
                print("Erorr \(error!.localizedDescription)")
                return
            }
            if granted {
                print("Auth. Granted")
            } else {
                print("Denied Notification")
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
