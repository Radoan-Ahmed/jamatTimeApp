import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/data/datasource/global_prayer_time_remote_source.dart';
import 'package:jamat_app/features/home/data/model/request_model/global_prayer_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/global_prayer_time_response_model.dart';
import 'package:jamat_app/features/home/domain/repository/global_prayer_time_repository.dart';

import '../../../../core/exceptions/internet_exception_thrower.dart';

@Injectable(as: GlobalPrayerTimeRepository)
class GlobalPrayerTimeRepositoryImpl extends GlobalPrayerTimeRepository {
  final GlobalPrayerTimeRemote remote;
  final InternetExceptionThrower networkExceptionThrower;

  GlobalPrayerTimeRepositoryImpl({
    required this.remote,
    required this.networkExceptionThrower,
  });

  @override
  Future<GlobalPrayerTimeResponseModel> globalPrayerTime(GlobalPrayerTimeRequestModel model) async {
    await networkExceptionThrower.throwInternetException();

    final response = await remote.globalPrayerTime(model);

    return response;
  }
}
