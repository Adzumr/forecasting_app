import 'dart:convert';
import 'dart:developer';

import 'package:forecasting_app/models/city_data_model.dart';
import 'package:forecasting_app/models/other_forecast_model.dart';
import 'package:forecasting_app/models/small_forecast_model.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class WeatherDataController extends GetxController {
  CityDataModel? cityDataModel;
  SmallForecastModel? smallForecastModel;
  OtherForecastModel? otherForecastModel;
  Future getOtherForecastData({
    String? token,
    String? cityId,
  }) async {
    String pageUrl = "view-other-forecast/${cityId!}";

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
        log("Other forecast: ${response.body}");
        otherForecastModel = OtherForecastModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      log("Request completed");
    }
  }

  Future getSmallForecastData({
    String? token,
    String? cityId,
  }) async {
    String pageUrl = "view-small-forecast/${cityId!}";
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
        log("Small forecast: ${response.body}");
        smallForecastModel =
            SmallForecastModel.fromJson(jsonDecode(response.body));
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      log("Request completed");
    }
  }

  Future getCityData({
    String? token,
    String? cityId,
  }) async {
    String pageUrl = "live-weather/${cityId!}";
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
        log("City Data: ${response.body}");
        cityDataModel = CityDataModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        log("${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      log("Request completed");
    }
  }
}
