class OtherForecastModel {
  final bool? status;
  final DATA? data;

  OtherForecastModel({
    this.status,
    this.data,
  });

  OtherForecastModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        data = (json['DATA'] as Map<String, dynamic>?) != null
            ? DATA.fromJson(json['DATA'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'status': status, 'DATA': data?.toJson()};
}

class DATA {
  final Day1? day1;
  final Day2? day2;
  final Day3? day3;
  final Day4? day4;
  final Day5? day5;
  final Day6? day6;
  final Day7? day7;
  final String? cityId;

  DATA({
    this.day1,
    this.day2,
    this.day3,
    this.day4,
    this.day5,
    this.day6,
    this.day7,
    this.cityId,
  });

  DATA.fromJson(Map<String, dynamic> json)
      : day1 = (json['day1'] as Map<String, dynamic>?) != null
            ? Day1.fromJson(json['day1'] as Map<String, dynamic>)
            : null,
        day2 = (json['day2'] as Map<String, dynamic>?) != null
            ? Day2.fromJson(json['day2'] as Map<String, dynamic>)
            : null,
        day3 = (json['day3'] as Map<String, dynamic>?) != null
            ? Day3.fromJson(json['day3'] as Map<String, dynamic>)
            : null,
        day4 = (json['day4'] as Map<String, dynamic>?) != null
            ? Day4.fromJson(json['day4'] as Map<String, dynamic>)
            : null,
        day5 = (json['day5'] as Map<String, dynamic>?) != null
            ? Day5.fromJson(json['day5'] as Map<String, dynamic>)
            : null,
        day6 = (json['day6'] as Map<String, dynamic>?) != null
            ? Day6.fromJson(json['day6'] as Map<String, dynamic>)
            : null,
        day7 = (json['day7'] as Map<String, dynamic>?) != null
            ? Day7.fromJson(json['day7'] as Map<String, dynamic>)
            : null,
        cityId = json['cityId'] as String?;

  Map<String, dynamic> toJson() => {
        'day1': day1?.toJson(),
        'day2': day2?.toJson(),
        'day3': day3?.toJson(),
        'day4': day4?.toJson(),
        'day5': day5?.toJson(),
        'day6': day6?.toJson(),
        'day7': day7?.toJson(),
        'cityId': cityId
      };
}

class Day1 {
  final num? temperature;
  final String? condition;

  Day1({
    this.temperature,
    this.condition,
  });

  Day1.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'] as num?,
        condition = json['condition'] as String?;

  Map<String, dynamic> toJson() =>
      {'temperature': temperature, 'condition': condition};
}

class Day2 {
  final num? temperature;
  final String? condition;

  Day2({
    this.temperature,
    this.condition,
  });

  Day2.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'] as num?,
        condition = json['condition'] as String?;

  Map<String, dynamic> toJson() =>
      {'temperature': temperature, 'condition': condition};
}

class Day3 {
  final num? temperature;
  final String? condition;

  Day3({
    this.temperature,
    this.condition,
  });

  Day3.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'] as num?,
        condition = json['condition'] as String?;

  Map<String, dynamic> toJson() =>
      {'temperature': temperature, 'condition': condition};
}

class Day4 {
  final num? temperature;
  final String? condition;

  Day4({
    this.temperature,
    this.condition,
  });

  Day4.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'] as num?,
        condition = json['condition'] as String?;

  Map<String, dynamic> toJson() =>
      {'temperature': temperature, 'condition': condition};
}

class Day5 {
  final num? temperature;
  final String? condition;

  Day5({
    this.temperature,
    this.condition,
  });

  Day5.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'] as num?,
        condition = json['condition'] as String?;

  Map<String, dynamic> toJson() =>
      {'temperature': temperature, 'condition': condition};
}

class Day6 {
  final num? temperature;
  final String? condition;

  Day6({
    this.temperature,
    this.condition,
  });

  Day6.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'] as num?,
        condition = json['condition'] as String?;

  Map<String, dynamic> toJson() =>
      {'temperature': temperature, 'condition': condition};
}

class Day7 {
  final num? temperature;
  final String? condition;

  Day7({
    this.temperature,
    this.condition,
  });

  Day7.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'] as num?,
        condition = json['condition'] as String?;

  Map<String, dynamic> toJson() =>
      {'temperature': temperature, 'condition': condition};
}
