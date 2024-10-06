import UIKit
import Flutter

class ViewController: UIViewController {
    
    var flutterEngine: FlutterEngine?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize Flutter engine if not already done
        flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
    }

    @IBAction func fetchApiDataButtonPressed(_ sender: UIButton) {
        let apiUrl = "https://jsonplaceholder.typicode.com/posts"

        // Create a Flutter method channel to communicate with Dart
        let channel = FlutterMethodChannel(
            name: "apiData",
            binaryMessenger: flutterEngine!.binaryMessenger
        )

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
