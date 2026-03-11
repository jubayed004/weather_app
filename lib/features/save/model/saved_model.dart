class SavedModel {
  final bool? success;
  final List<SavedItem>? data;

  SavedModel({this.success, this.data});

  factory SavedModel.fromJson(Map<String, dynamic> json) => SavedModel(
    success: json["success"],
    data: json["data"] == null
        ? []
        : List<SavedItem>.from(json["data"]!.map((x) => SavedItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SavedItem {
  final String? id;
  final String? stationName;
  final String? location;
  final String? simpleLabel;
  final int? totalScore;
  final String? period;
  final DateTime? savedAt;

  SavedItem({
    this.id,
    this.stationName,
    this.location,
    this.simpleLabel,
    this.totalScore,
    this.period,
    this.savedAt,
  });

  factory SavedItem.fromJson(Map<String, dynamic> json) => SavedItem(
    id: json["id"],
    stationName: json["stationName"],
    location: json["location"],
    simpleLabel: json["simpleLabel"],
    totalScore: json["totalScore"],
    period: json["period"],
    savedAt: json["savedAt"] == null ? null : DateTime.parse(json["savedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stationName": stationName,
    "location": location,
    "simpleLabel": simpleLabel,
    "totalScore": totalScore,
    "period": period,
    "savedAt": savedAt?.toIso8601String(),
  };
}
