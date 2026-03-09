class TermsConditionModel {
  final bool? success;
  final Data? data;

  TermsConditionModel({this.success, this.data});

  factory TermsConditionModel.fromJson(Map<String, dynamic> json) =>
      TermsConditionModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"success": success, "data": data?.toJson()};
}

class Data {
  final String? title;
  final List<Section>? sections;
  final DateTime? lastUpdated;

  Data({this.title, this.sections, this.lastUpdated});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    sections: json["sections"] == null
        ? []
        : List<Section>.from(json["sections"]!.map((x) => Section.fromJson(x))),
    lastUpdated: json["lastUpdated"] == null
        ? null
        : DateTime.parse(json["lastUpdated"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "sections": sections == null
        ? []
        : List<dynamic>.from(sections!.map((x) => x.toJson())),
    "lastUpdated":
        "${lastUpdated!.year.toString().padLeft(4, '0')}-${lastUpdated!.month.toString().padLeft(2, '0')}-${lastUpdated!.day.toString().padLeft(2, '0')}",
  };
}

class Section {
  final String? heading;
  final String? content;

  Section({this.heading, this.content});

  factory Section.fromJson(Map<String, dynamic> json) =>
      Section(heading: json["heading"], content: json["content"]);

  Map<String, dynamic> toJson() => {"heading": heading, "content": content};
}
