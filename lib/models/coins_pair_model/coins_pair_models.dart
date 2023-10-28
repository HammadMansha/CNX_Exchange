

import 'dart:convert';

class Welcome {
  bool success;
  List<Datum> data;

  Welcome({
    required this.success,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String coinName;
  String coinSymbol;
  String coinDiscription;
  String coinImg;
  double coinRate;
  int status;
  Remark remark;
  DateTime edate;
  dynamic type;
  double latestRate;
  double? coinRate1;
  double change;

  Datum({
    required this.id,
    required this.coinName,
    required this.coinSymbol,
    required this.coinDiscription,
    required this.coinImg,
    required this.coinRate,
    required this.status,
    required this.remark,
    required this.edate,
    required this.type,
    required this.latestRate,
    required this.coinRate1,
    required this.change,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    coinName: json["coin_name"],
    coinSymbol: json["coin_symbol"],
    coinDiscription: json["coin_discription"],
    coinImg: json["coin_img"],
    coinRate: json["coin_rate"]?.toDouble(),
    status: json["status"],
    remark: remarkValues.map[json["remark"]]!,
    edate: DateTime.parse(json["edate"]),
    type: json["type"],
    latestRate: json["latestRate"]?.toDouble(),
    coinRate1: json["coin_rate1"]?.toDouble(),
    change: json["change"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "coin_name": coinName,
    "coin_symbol": coinSymbol,
    "coin_discription": coinDiscription,
    "coin_img": coinImg,
    "coin_rate": coinRate,
    "status": status,
    "remark": remarkValues.reverse[remark],
    "edate": edate.toIso8601String(),
    "type": type,
    "latestRate": latestRate,
    "coin_rate1": coinRate1,
    "change": change,
  };
}

enum Remark {
  LOCAL
}

final remarkValues = EnumValues({
  "local": Remark.LOCAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
