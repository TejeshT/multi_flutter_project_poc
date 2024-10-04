import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    var flutterEngine: FlutterEngine?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Initialize Flutter engine
        flutterEngine = FlutterEngine(name: "my_flutter_engine")
        flutterEngine?.run()

        // Set up the method channel
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "com.example.native_module/api",
                                           binaryMessenger: flutterEngine!.binaryMessenger)

        // Call the method channel handler from Dart
        channel.setMethodCallHandler { (call, result) in
            if call.method == "fetchApiData" {
                if let url = call.arguments as? String {
                    // Here you can fetch the data from Dart
                    // For now, we won't change the Dart code
                    // Instead, you can call the Dart function directly from your Dart code
                    let apiService = ApiService() // Assuming you have a Dart API service to call
                    let response = await apiService.fetchApiData(url)
                    result(response)
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected a URL", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
