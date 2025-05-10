import 'package:jamat_app/features/home/data/model/request_model/global_prayer_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/global_prayer_time_response_model.dart';

abstract class GlobalPrayerTimeRepository {
  Future<GlobalPrayerTimeResponseModel> globalPrayerTime(GlobalPrayerTimeRequestModel model);
}