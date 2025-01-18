import 'package:injectable/injectable.dart';
import 'package:jamat_app/features/home/data/datasource/jamat_time_remote_source.dart';
import 'package:jamat_app/features/home/data/model/request_model/jamat_time_request_model.dart';
import 'package:jamat_app/features/home/data/model/response_model/jamat_time_response_model.dart';
import 'package:jamat_app/features/home/domain/repository/jamat_time_repository.dart';

import '../../../../core/exceptions/internet_exception_thrower.dart';

@Injectable(as: JamatTimeRepository)
class JamatTimeRepositoryImpl extends JamatTimeRepository {
  final JamatTimeRemote remote;
  final InternetExceptionThrower networkExceptionThrower;

  JamatTimeRepositoryImpl({
    required this.remote,
    required this.networkExceptionThrower,
  });

  @override
  Future<JamatTimeResponseModel> jamatTime(JamatTimeRequestModel model) async {
    await networkExceptionThrower.throwInternetException();

    final response = await remote.jamatTime(model);

    return response;
  }
}
