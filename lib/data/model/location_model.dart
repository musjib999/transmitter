class LocationModel {
  final double longitude;
  final double latitude;
  final String email;

  LocationModel({
    required this.latitude,
    required this.longitude,
    required this.email,
  });

  Map<String, dynamic> toJson() =>
      {"longitude": longitude, "latitude": latitude, "email": email};
}
