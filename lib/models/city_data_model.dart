class CityDataModel {
  final bool? status;
  final String? msg;
  final Data? data;

  CityDataModel({
    this.status,
    this.msg,
    this.data,
  });

  CityDataModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as bool?,
      msg = json['msg'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'msg' : msg,
    'data' : data?.toJson()
  };
}

class Data {
  final String? date;
  final num? minTemperature;
  final num? maxTemperature;
  final num? temperature;
  final String? condition;
  final num? windSpeed;
  final num? humidity;
  final String? cityId;

  Data({
    this.date,
    this.minTemperature,
    this.maxTemperature,
    this.temperature,
    this.condition,
    this.windSpeed,
    this.humidity,
    this.cityId,
  });

  Data.fromJson(Map<String, dynamic> json)
    : date = json['date'] as String?,
      minTemperature = json['minTemperature'] as num?,
      maxTemperature = json['maxTemperature'] as num?,
      temperature = json['temperature'] as num?,
      condition = json['condition'] as String?,
      windSpeed = json['windSpeed'] as num?,
      humidity = json['humidity'] as num?,
      cityId = json['cityId'] as String?;

  Map<String, dynamic> toJson() => {
    'date' : date,
    'minTemperature' : minTemperature,
    'maxTemperature' : maxTemperature,
    'temperature' : temperature,
    'condition' : condition,
    'windSpeed' : windSpeed,
    'humidity' : humidity,
    'cityId' : cityId
  };
}