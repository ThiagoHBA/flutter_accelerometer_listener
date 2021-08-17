import 'dart:convert';

class SensorData {
  int index;
  double accX;
  double accY;
  double accZ;
  double timeSec;
  SensorData({
    required this.index,
    required this.accX,
    required this.accY,
    required this.accZ,
    required this.timeSec,
  });


  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'accX': accX,
      'accY': accY,
      'accZ': accZ,
      'timeSec': timeSec,
    };
  }

  factory SensorData.fromMap(Map<String, dynamic> map) {
    return SensorData(
      index: map['index'],
      accX: map['accX'],
      accY: map['accY'],
      accZ: map['accZ'],
      timeSec: map['timeSec'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SensorData.fromJson(String source) => SensorData.fromMap(json.decode(source));
}
