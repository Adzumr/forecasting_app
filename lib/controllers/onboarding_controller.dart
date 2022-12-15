import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class OnboardingController extends GetxController {
  Future signUpService() async {
    const String homeUrl = "https://www.google.com";
    final response = await http.get(
      Uri.parse(homeUrl),
    );

    try {
      if (response.statusCode == 200) {
        log(response.body);
      } else {
        log("${response.statusCode}");
      }
    } on Exception catch (e) {
      log("Exception: $e");
    }
  }
}
