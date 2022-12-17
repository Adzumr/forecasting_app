import 'dart:convert';
import 'dart:developer';

import 'package:forecasting_app/models/login_model.dart';
import 'package:forecasting_app/utils/constants.dart';
import 'package:forecasting_app/views/forecast_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/cities_model.dart';
import '../views/congratulation_screen.dart';

class OnboardingController extends GetxController {
  LoginModel? loginModel;
  CitiesModel? citiesModel;
  Future getCitiesData({
    String? token,
  }) async {
    const pageUrl = "city-list";
    final header = {
      "content-type": " application/json",
      "Authorization": "Bearer $token",
    };

    try {
      log("Loading...");
      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log(response.body);
        citiesModel = CitiesModel.fromJson(jsonDecode(response.body));
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
      log("Loading...");
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
      log("Loading...");
      await http
          .post(
        Uri.parse(baseUrl + pageUrl),
        body: jsonEncode(body),
        headers: header,
      )
          .then((response) async {
        if (response.statusCode >= 200 && response.statusCode < 300) {
          log(response.body);
          loginModel = LoginModel.fromJson(jsonDecode(response.body));
          await getCitiesData(token: loginModel!.token);
        } else {
          log("${response.statusCode}");
          Get.snackbar(
            "Error",
            "Invalid credentials",
          );
        }
      });
    } catch (e) {
      log("Error: $e");
    } finally {
      log("Request completed");
    }
  }
}
