import 'package:flutter/services.dart';
import 'package:demo_poc/demo_poc.dart';

class ApiService {
  static const MethodChannel _channel = MethodChannel('apiData');

  static void setupMethodChannel() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'fetchApiData') {
        final String apiUrl = call.arguments;
        try {
          final response = await fetchApiData(apiUrl: apiUrl);
          return response;
        } catch (e) {
          return 'Error: $e';
        }
      }
    });
  }
}
