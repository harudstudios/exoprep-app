import 'package:root/src/core/common/models/response_model.dart';
import 'package:root/src/core/constants/endpoints.dart';
import 'package:root/src/core/network/dio_client.dart';

class LeaderboardService {
  final DioClient _dioClient = DioClient();

  Future<ResponseModel> getLeafExams({String? query}) async {
    final response = await _dioClient.get(AppEndpoints.getLeafExams());
    return ResponseModel.fromResponse(response);
  }

  Future<ResponseModel> getStreakLeaderboardByExam({required String examID}) async {
    final response = await _dioClient.get(AppEndpoints.getStreakLeaderBoardByExam(examID));
    return ResponseModel.fromResponse(response);
  }

  Future<ResponseModel> getScoreLeaderboardByExam({required String examID}) async {
    final response = await _dioClient.get(AppEndpoints.getScoreLeaderBoardByExam(examID));
    return ResponseModel.fromResponse(response);
  }
}
