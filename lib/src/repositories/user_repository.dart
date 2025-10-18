import 'package:dio/dio.dart';
import 'package:root/src/core/common/models/response_model.dart';
import 'package:root/src/core/exceptions/network_exception.dart';
import 'package:root/src/services/user_service.dart';

class UserRepository {
  final UserService _userService;

  UserRepository({UserService? userService}) : _userService = userService ?? UserService();

  Future<ResponseModel> createUser({required Map<String, dynamic> data}) async {
    try {
      return await _userService.createUser(data: data);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
