class UserModel {
  final String email;
  UserModel({required this.email});

  Map<String, dynamic> toJson() => {"email": email};
}
