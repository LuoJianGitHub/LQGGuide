//
//  AppDelegate.swift
//  LQGGuide
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import LQGBaseAppDelegate
import LQGGuide

@UIApplicationMain
class AppDelegate: LQGBaseAppDelegate {
    
    override init() {
        super.init();
        
        self.needShowGuideVCBlock = {
            return !UserDefaults.standard.bool(forKey: "showedGuideVC")
        }
        
        self.getGuideVCBlock = {
            return LQGGuideController.init()
        }
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let status = super.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        UserDefaults.standard.rx.observe(Bool.self, "showedGuideVC", options: .new).subscribe { (value) in
            self.lqg_setupRootViewController()
        } onDisposed: {}
        
        return status
    }

}

