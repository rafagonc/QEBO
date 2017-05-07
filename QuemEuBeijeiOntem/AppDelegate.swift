//
//  AppDelegate.swift
//  QuemEuBeijeiOntem
//
//  Created by Rafael Gonzalves on 07/05/17.
//  Copyright © 2017 Rafael Gonzalves. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            window.layer.cornerRadius = 12
            window.layer.masksToBounds = true
            window.backgroundColor = UIColor.white
            window.rootViewController = UINavigationController.init(rootViewController: QEBOContactListViewController())
            window.makeKeyAndVisible();
        }
        return true
    }


}

