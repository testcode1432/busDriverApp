// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    required this.statusCode,
    required this.body,
  });

  int statusCode;
  Map body;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      ApiResponse(statusCode: json["code"], body: json["body"]);

  Map<String, dynamic> toJson() => {"code": statusCode, "body": body};
}
