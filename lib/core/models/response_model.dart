import '/core/entities/response.dart';

class ResponseModel extends Response {

  const ResponseModel({required int? statusCode, required String? statusMessage, required bool? success}) : super(statusCode: statusCode, statusMessage: statusMessage, success: success);

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
      success: json["success"],
    );
  }
}