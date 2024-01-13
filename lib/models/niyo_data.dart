import 'dart:convert';

List<NiyoXData> getDataFromJson(String str) =>
    List<NiyoXData>.from(json.decode(str).map((x) => NiyoXData.fromJson(x)));

class NiyoXData {
  int userId;
  int id;
  String title;
  String body;

  NiyoXData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory NiyoXData.fromJson(Map<String, dynamic> json) => NiyoXData(
        userId: json["userId"]?.toInt() ?? 0,
        id: json["id"]?.toInt() ?? 0,
        title: json["title"] ?? "",
        body: json["body"] ?? "",
      );
  
  factory NiyoXData.empty() => NiyoXData.fromJson({});
}
