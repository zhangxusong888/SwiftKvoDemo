//
//  ViewController.swift
//  SwiftKvoDemo
//
//  Created by zhangxusong on 15/11/18.
//  Copyright © 2015年 mo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let observer = MyObserver()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "myDateNotificationHandler:", name: MyObjectToObserve.myDateNotification, object: nil)
    }

    func myDateNotificationHandler(notification: NSNotification) {
        if let myDate = notification.userInfo?[MyObjectToObserve.myDateKey] {
            print("Notification Info: \(myDate)")
        }
    }


    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        NSNotificationCenter.defaultCenter().removeObserver(self, name: MyObjectToObserve.myDateNotification, object: nil)
    }
}

