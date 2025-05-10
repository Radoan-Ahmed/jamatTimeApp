import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/data/model/request_model/global_prayer_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/global_prayer_time_response_model.dart';
import 'package:jamat_app/features/home/domain/repository/global_prayer_time_repository.dart';


@Injectable()
class GlobalPrayerTimeUsecase {
  final GlobalPrayerTimeRepository repository;

  GlobalPrayerTimeUsecase({required this.repository});

  Future<GlobalPrayerTimeResponseModel> call(GlobalPrayerTimeRequestModel requestModel) async =>
      await repository.globalPrayerTime(requestModel);
}
