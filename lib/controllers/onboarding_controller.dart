import 'dart:convert';
import 'dart:developer';

import 'package:forecasting_app/models/login_model.dart';
import 'package:forecasting_app/utils/constants.dart';
import 'package:forecasting_app/views/forecast_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../views/congratulation_screen.dart';

class OnboardingController extends GetxController {
  LoginModel? loginModel;
  Future registerUser({
    String? name,
    String? emailAdress,
    String? phoneNumber,
    String? password,
    String? country,
  }) async {
    const pageUrl = "create-user";
    final header = {
      "content-type": " application/json",
    };
    final body = {
      "name": name!.trim(),
      "email": emailAdress!.trim(),
      "phone": phoneNumber!.trim(),
      "password": password!.trim(),
      "country": country!.trim(),
    };
    try {
      log("Authenticating");
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        body: jsonEncode(body),
        headers: header,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Get.to(() => const CongratulationScreens());
      } else {
        final result = jsonDecode(response.body);
        final message = result["message"];
        log("message: $message");
        log(response.body);
        Get.snackbar(
          "Error",
          "$message",
        );
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      log("Request completed");
    }
  }

  Future login({
    String? emailAdress,
    String? password,
  }) async {
    const pageUrl = "login";
    final header = {
      "content-type": " application/json",
    };
    final body = {
      "email": emailAdress!.trim(),
      "password": password!.trim(),
    };
    try {
      log("Authenticating");
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        body: jsonEncode(body),
        headers: header,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        loginModel = LoginModel.fromJson(jsonDecode(response.body));
        log(response.body);
        Get.to(() => const ForecastScreen());
      } else {
        log("${response.statusCode}");
        Get.snackbar(
          "Error",
          "Invalid credentials",
        );
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      log("Request completed");
    }
  }
}
