class StateModel {
  final bool? success;
  final List<StateModelDatum>? data;

  StateModel({this.success, this.data});

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    success: json["success"],
    data: json["data"] == null
        ? []
        : List<StateModelDatum>.from(
            json["data"]!.map((x) => StateModelDatum.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class StateModelDatum {
  final String? code;
  final String? name;

  StateModelDatum({this.code, this.name});

  factory StateModelDatum.fromJson(Map<String, dynamic> json) =>
      StateModelDatum(code: json["code"], name: json["name"]);

  Map<String, dynamic> toJson() => {"code": code, "name": name};

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StateModelDatum && other.code == code && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;
}
