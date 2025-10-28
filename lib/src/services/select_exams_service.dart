import 'package:root/src/core/common/models/response_model.dart';
import 'package:root/src/core/constants/endpoints.dart';
import 'package:root/src/core/network/dio_client.dart';

class SelectExamsService {
  final DioClient _dioClient = DioClient();

  Future<ResponseModel> getExams() async {
    final response = await _dioClient.get(AppEndpoints.getExams);
    return ResponseModel.fromResponse(response);
  }
}
