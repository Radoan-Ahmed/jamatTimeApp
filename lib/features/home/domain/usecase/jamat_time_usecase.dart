import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/data/model/request_model/jamat_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/jamat_time_response_model.dart';
import 'package:jamat_app/features/home/domain/repository/jamat_time_repository.dart';


@Injectable()
class JamatTimeUsecase {
  final JamatTimeRepository repository;

  JamatTimeUsecase({required this.repository});

  Future<JamatTimeResponseModel> call(JamatTimeRequestModel requestModel) async =>
      await repository.jamatTime(requestModel);
}
