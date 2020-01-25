//
//  AppDelegate.swift
//  FizzBuzz-Swift
//
//  Created by Parth on 25/01/20.
//  Copyright © 2020 Parth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        redirectToFizzBuzzScreen()
        decorateNavigationBarAppearance()
        return true
    }

    func redirectToFizzBuzzScreen(){
        let fizzBuzzVC = FizzBuzzVC()
        let navigationController = UINavigationController(rootViewController: fizzBuzzVC)
        navigationController.navigationBar.isTranslucent = true
        navigationController.isNavigationBarHidden = false
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    func decorateNavigationBarAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.ThemeColor.appThemeColor
        UINavigationBar.appearance().tintColor = UIColor.ThemeColor.labelColor
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
    }
}
