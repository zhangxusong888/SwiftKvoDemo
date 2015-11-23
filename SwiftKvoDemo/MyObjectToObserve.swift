//
//  MyObjectToObserve.swift
//  SwiftKvoDemo
//
//  Created by zhangxusong on 15/11/19.
//  Copyright © 2015年 mo. All rights reserved.
//

import UIKit

class MyObjectToObserve: NSObject {
    static let myDateNotification = "myDateNotification"
    static let myDateKey = "myDateKey"

    dynamic var myDate = NSDate() {
        didSet {
            NSNotificationCenter.defaultCenter().postNotificationName(MyObjectToObserve.myDateNotification, object: nil, userInfo: [MyObjectToObserve.myDateKey : myDate])
        }
    }
    func updateDate() {
        myDate = NSDate()
    }
}
