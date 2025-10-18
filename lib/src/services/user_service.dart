import 'package:root/src/core/common/models/response_model.dart';
import 'package:root/src/core/constants/endpoints.dart';
import 'package:root/src/core/network/dio_client.dart';

class UserService {
  final DioClient _dioClient = DioClient();

  Future<ResponseModel> createUser({required Map<String, dynamic> data}) async {
    final response = await _dioClient.post(AppEndpoints.createUser, data: data);
    return ResponseModel.fromResponse(response);
  }
}
