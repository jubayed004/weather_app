class CountiesModel {
  final bool? success;
  final List<Datum>? data;

  CountiesModel({this.success, this.data});

  factory CountiesModel.fromJson(Map<String, dynamic> json) => CountiesModel(
    success: json["success"],
    data: json["data"] == null
        ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? fips;
  final String? name;
  final String? state;

  Datum({this.fips, this.name, this.state});

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(fips: json["fips"], name: json["name"], state: json["state"]);

  Map<String, dynamic> toJson() => {"fips": fips, "name": name, "state": state};

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Datum &&
        other.fips == fips &&
        other.name == name &&
        other.state == state;
  }

  @override
  int get hashCode => fips.hashCode ^ name.hashCode ^ state.hashCode;
}
