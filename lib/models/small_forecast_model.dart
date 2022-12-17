class SmallForecastModel {
  final List<DATA>? data;

  SmallForecastModel({
    this.data,
  });

  SmallForecastModel.fromJson(Map<String, dynamic> json)
      : data = (json['DATA'] as List?)
            ?.map((dynamic e) => DATA.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'DATA': data?.map((e) => e.toJson()).toList()};
}

class DATA {
  final String? id;
  final String? time;
  final num? temperature;
  final String? condition;
  final String? cityId;
  final String? createdAt;
  final String? updatedAt;

  DATA({
    this.id,
    this.time,
    this.temperature,
    this.condition,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  DATA.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        time = json['time'] as String?,
        temperature = json['temperature'] as num?,
        condition = json['condition'] as String?,
        cityId = json['cityId'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'time': time,
        'temperature': temperature,
        'condition': condition,
        'cityId': cityId,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
