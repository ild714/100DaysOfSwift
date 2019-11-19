//
//  ViewController.swift
//  Project21
//
//  Created by Ильдар Нигметзянов on 18.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(sheduleLocal))
    }

    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert,.badge,.sound]) { (granted, error) in
            if granted {
                print ("Ya")
            } else {
                print ("No")
            }
        }
    }
    
    @objc func sheduleLocal() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData":"fizzbuzz"]
        content.sound = .default
        
        var dataComponents = DateComponents()
        dataComponents.hour = 10
        dataComponents.minute = 30
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dataComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
}

