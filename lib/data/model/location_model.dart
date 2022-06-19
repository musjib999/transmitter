class LocationModel {
  final double longitude;
  final double latitude;

  LocationModel({required this.latitude, required this.longitude});

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
      };
}
