class ApiModel {
  int statusCode;
  dynamic body;
  String message;
  ApiModel(
      {required this.statusCode, required this.body, required this.message});

  Map<String, dynamic> toJson() => {
        "code": statusCode,
        "body": body,
        "message": message,
      };
}
