
# flutter_quick_look

iOS Quick Look implementation on Flutter.

## Usage

You need to setup your root view controller as UINavigationController.
Example  :

    // AppDelegate.swift
    
    import UIKit
    import Flutter
    
    @UIApplicationMain
    @objc class AppDelegate: FlutterAppDelegate {
      var navigationController: UINavigationController?;    
        
      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController
        GeneratedPluginRegistrant.register(with: self)
        self.navigationController = UINavigationController(rootViewController: flutterViewController);
        self.navigationController?.setNavigationBarHidden(true, animated: false);
            
        self.window = UIWindow(frame: UIScreen.main.bounds);
        self.window.rootViewController = self.navigationController;
        self.window.makeKeyAndVisible();
    
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    }

Import `package:flutter_quick_look/flutter_quick_look.dart` use `FlutterQuickLook.openURL(filePath);` to launch Quick Look

You will find the complete example in the example directory.
