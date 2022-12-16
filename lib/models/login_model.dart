class LoginModel {
  final String? msg;
  final String? email;
  final String? token;
  final LiveWeather? liveWeather;

  LoginModel({
    this.msg,
    this.email,
    this.token,
    this.liveWeather,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : msg = json['msg'] as String?,
        email = json['email'] as String?,
        token = json['token'] as String?,
        liveWeather = (json['liveWeather'] as Map<String, dynamic>?) != null
            ? LiveWeather.fromJson(json['liveWeather'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'email': email,
        'token': token,
        'liveWeather': liveWeather?.toJson()
      };
}

class LiveWeather {
  final String? id;
  final String? date;
  final num? minTemperature;
  final num? maxTemperature;
  final num? temperature;
  final String? condition;
  final num? windSpeed;
  final num? humidity;
  final String? cityId;
  final String? createdAt;
  final String? updatedAt;

  LiveWeather({
    this.id,
    this.date,
    this.minTemperature,
    this.maxTemperature,
    this.temperature,
    this.condition,
    this.windSpeed,
    this.humidity,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  LiveWeather.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        date = json['date'] as String?,
        minTemperature = json['minTemperature'] as num?,
        maxTemperature = json['maxTemperature'] as num?,
        temperature = json['temperature'] as num?,
        condition = json['condition'] as String?,
        windSpeed = json['windSpeed'] as num?,
        humidity = json['humidity'] as num?,
        cityId = json['cityId'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'date': date,
        'minTemperature': minTemperature,
        'maxTemperature': maxTemperature,
        'temperature': temperature,
        'condition': condition,
        'windSpeed': windSpeed,
        'humidity': humidity,
        'cityId': cityId,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
