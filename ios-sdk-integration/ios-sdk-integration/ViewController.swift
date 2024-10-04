import UIKit
import Flutter

class ViewController: UIViewController {
    
    var flutterEngine: FlutterEngine?  // Ensure that you have a FlutterEngine instance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize your Flutter engine
        flutterEngine = FlutterEngine()
        flutterEngine?.run()
        // Do any additional setup after loading the view.
    }

    @IBAction func fetchApiDataButtonPressed(_ sender: UIButton) {
        let apiUrl = "https://jsonplaceholder.typicode.com/posts"  // Replace with your API URL

        // Safely unwrap the flutterEngine
        guard let engine = flutterEngine else {
            print("Flutter engine is not initialized.")
            return
        }

        // Create a Flutter method channel to communicate with Dart
        let channel = FlutterMethodChannel(name: "com.example.native_module/api",
                                           binaryMessenger: engine.binaryMessenger)

        // Call the Dart function
        channel.invokeMethod("fetchApiData", arguments: apiUrl) { (response) in
            if let response = response as? String {
                print("Response from Dart: \(response)")
                // Handle the response, e.g., update your UI
            } else {
                print("Failed to get response from Dart")
            }
        }
    }
}
