import UIKit
import Flutter
//import FlutterPluginRegistrant

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var flutterEngine: FlutterEngine?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        flutterEngine = FlutterEngine(name: "my flutter engine")
        flutterEngine?.run()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
