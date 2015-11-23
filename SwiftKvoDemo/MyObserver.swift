//
//  MyObserver.swift
//  SwiftKvoDemo
//
//  Created by zhangxusong on 15/11/19.
//  Copyright © 2015年 mo. All rights reserved.
//

import UIKit

private var myContext = 0

class MyObserver: NSObject {
    var objectToObserver = MyObjectToObserve()

    var timer: NSTimer? = nil

    override init() {
        super.init()
        objectToObserver.addObserver(self, forKeyPath: "myDate", options: .New, context: &myContext)
         NSThread.detachNewThreadSelector("createTimer", toTarget: self, withObject: nil)
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &myContext {
            if let newValue = change?[NSKeyValueChangeNewKey] {
                print("date changed: \(newValue)")
            }
        } else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }

    deinit {
        objectToObserver.removeObserver(self, forKeyPath: "myDate", context: &myContext)
        timer?.invalidate()
        timer = nil
    }

    // timer functions
    func createTimer() {
        timer = NSTimer(timeInterval: 1, target: self, selector: "timerHandler", userInfo: nil, repeats: true)
        if let timer = timer {
            NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
            NSRunLoop.currentRunLoop().run()
        }
    }

    func timerHandler() {
        objectToObserver.updateDate()
    }

}
