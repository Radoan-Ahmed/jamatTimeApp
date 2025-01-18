import 'package:jamat_app/features/home/data/model/request_model/jamat_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/jamat_time_response_model.dart';

abstract class JamatTimeRepository {
  Future<JamatTimeResponseModel> jamatTime(JamatTimeRequestModel model);
}