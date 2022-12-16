import 'dart:convert';
import 'dart:developer';
import 'package:forecasting_app/models/cities_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../utils/constants.dart';

class WeatherDataController extends GetxController {
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
      log("Authenticating");
      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        citiesModel = CitiesModel.fromJson(jsonDecode(response.body));
        log(response.body);
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
