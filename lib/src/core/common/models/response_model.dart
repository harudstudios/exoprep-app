import 'package:dio/dio.dart';

class ResponseModel {
  final bool success;
  final Map<String, dynamic>? data;
  final String? message;
  final String? error;

  ResponseModel({
    required this.success,
    this.data,
    this.message,
    this.error,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'] as bool,
      data: json['data'] != null ? Map<String, dynamic>.from(json['data'] as Map<String, dynamic>) : null,
      message: json['message'] as String?,
      error: json['error'] as String?,
    );
  }

  factory ResponseModel.fromResponse(Response response) {
    try {
      final data = response.data;

      if (data is Map<String, dynamic>) {
        return ResponseModel.fromJson(data);
      } else {
        // When API returns a non-map response (like string or list)
        return ResponseModel(
          success: response.statusCode != null &&
              response.statusCode! >= 200 &&
              response.statusCode! < 300,
          data: {'raw': data},
          message: response.statusMessage,
          error: data?.toString(),
        );
      }
    } catch (e) {
      return ResponseModel(
        success: false,
        error: 'Failed to parse response: $e',
      );
    }
  }
}
