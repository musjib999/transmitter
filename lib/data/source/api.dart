import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/api_model.dart';

Future<ApiModel> getRequest(
    {required Uri url, Map<String, String>? headers}) async {
  ApiModel finalResponse;
  try {
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      finalResponse = ApiModel(
        statusCode: response.statusCode,
        body: decodeData,
        message: '',
      );
    } else {
      finalResponse = ApiModel(
        statusCode: response.statusCode,
        body: null,
        message: '',
      );
    }
  } catch (e) {
    finalResponse = ApiModel(
      statusCode: 500,
      body: null,
      message: e.toString(),
    );
  }

  return finalResponse;
}
