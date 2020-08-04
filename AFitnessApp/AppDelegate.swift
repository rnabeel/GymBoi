//
//  AppDelegate.swift
//  AFitnessApp
//
//  Created by nabeel.dce on 21/07/2020.
//  Copyright © 2020 Nabeel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController:WorkoutVC())
        window?.makeKeyAndVisible()
        
        return true
        

}

}
