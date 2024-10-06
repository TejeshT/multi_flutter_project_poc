/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:http/http.dart' as http;
import 'dart:convert';


export 'src/demo_poc_base.dart';

/// Function to call an API and fetch data.
Future fetchApiData ({required String apiUrl}) async {
  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }
  catch (e) {
    throw Exception('Error: $e');
  }
}

// TODO: Export any libraries intended for clients of this package.
