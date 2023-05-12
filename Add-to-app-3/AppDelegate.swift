//
//  AppDelegate.swift
//  Add-to-app-2
//
//  Created by OLX on 09/05/23.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: FlutterAppDelegate {

    lazy var flutterEngine = FlutterEngine(name: "add to app Flutter")
    lazy var flutterEngine2 = FlutterEngine(name: "secondary")

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        flutterEngine.run();
        GeneratedPluginRegistrant.register(with: self.flutterEngine);

        flutterEngine2.run(withEntrypoint: "secondary")
        GeneratedPluginRegistrant.register(with: self.flutterEngine2);

        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }


}

//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//    let engines = FlutterEngineGroup(name: "multiple-flutters", project: nil)
//}
