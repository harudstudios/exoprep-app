import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:root/src/services/home_service.dart';
import 'package:root/src/models/exam_model/exam_model.dart';
import 'package:root/src/core/exceptions/network_exception.dart';

class HomeRepository {
  final HomeService _homeService;

  HomeRepository({HomeService? homeService}) : _homeService = homeService ?? HomeService();

  Future<List<Exam>> getLeafExams({String? query}) async {
    try {
      final response = await _homeService.getLeafExams();
      log('Response: $response');
      final examJson = (response.data?['exams'] as List<dynamic>?) ?? [];
      return examJson.map((json) => Exam.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
