//
//  AppDelegate.swift
//  WorldApi
//
//  Created by Jason Du on 9/23/17.
//  Copyright © 2017 Jason Du. All rights reserved.
//

import UIKit
import DocuSignSDK
import HyperTrack
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var navigationController: UINavigationController = { [unowned self] in
        let controller = UINavigationController(rootViewController: self.presentationController)

        return controller
        }()

    lazy var presentationController: TutorialViewController = {
        return TutorialViewController(pages: [])
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        DSMManager.setup()
        HyperTrack.initialize("pk_test_e9d10519b35085979d1b08a7c7f9127c6eb4cfe0")
        HyperTrack.requestAlwaysAuthorization()
        HyperTrack.requestMotionAuthorization()

        let configuration = ParseClientConfiguration {
            $0.applicationId = "yv9WK7yZKfjBwkosHhnJG1tBDFVjzdcl0Gw27tgr"
            $0.clientKey = "85t2kl92Pd7wIrO3bbR4r3faiNO6VzydV2I9IHB3"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)

        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().barStyle = .default
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        let testObject = PFObject(className: "TrackingId")
        testObject["Id"] = "dfsdgsdhfdg-512dc21"
        testObject.saveInBackground { (success, failure) in
            print(success)
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

