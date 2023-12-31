import 'dart:convert';

List<ApiData> dataFromJson(String str) =>
    List<ApiData>.from(json.decode(str).map((x) => ApiData.fromJson(x)));

class ApiData {
  final String siteCode;
  final String dateTime;
  final double durationNS;
  final double scaledValue;

  ApiData({
    required this.siteCode,
    required this.dateTime,
    required this.durationNS,
    required this.scaledValue,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) => ApiData(
        siteCode: json['SiteCode'],
        dateTime: json['DateTime'],
        durationNS: json['DurationNS'].toDouble(),
        scaledValue: json['ScaledValue'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'SiteCode': siteCode,
        'DateTime': dateTime,
        'DurationNS': durationNS,
        'ScaledValue': scaledValue,
      };
}
