//
//  AppDelegate.swift
//  GoodWeather
//
//  Created by Sri Hari Karthick on 03/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let backgroundColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UIBarButtonItem.appearance().tintColor = UIColor.white
        
        return true
    }
    
    private func setupUserDefaultSettings() {
        let userDefaults = UserDefaults.standard
        if userDefaults.value(forKey: "unit") == nil {
            userDefaults.setValue(Unit.celsius.rawValue,
                                  forKey: "unit")
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

