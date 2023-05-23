class DiractionModel {
  final String distance;
  final String duration;
  DiractionModel({
    required this.distance,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'distance': distance,
      'duration': duration,
    };
  }

  factory DiractionModel.fromMap(Map<String, dynamic> map) {
    final data = Map<String, dynamic>.from(map['routes'][0]);
    final legs = data['legs'][0];

    return DiractionModel(
      distance: legs['distance']['text'] as String,
      duration: legs['duration']['text'] as String,
    );
  }
}
